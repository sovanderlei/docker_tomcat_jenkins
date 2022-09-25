FROM tomcat:9-jdk11-openjdk

LABEL "Name:": "Vanderlei Soares de Oliveira"
LABEL version="1.0"
LABEL description="This docker example  \
for tomcat server."

RUN apt -y update
RUN apt-get update && apt-get -y upgrade


EXPOSE 8080
USER root

RUN chmod +x /usr/local/tomcat/bin/catalina.sh
 
RUN apt -y install curl
RUN apt-get install gzip
RUN apt install ufw -y
 
RUN apt -y install tomcat9 tomcat9-admin tomcat9-examples
 
RUN apt -y install nano

RUN mkdir /usr/local/tomcat/webapps2
RUN mkdir /usr/local/tomcat/webapps/manager
RUN mkdir /usr/local/tomcat/webapps/manager/META-INF

RUN mv /usr/local/tomcat/webapps/ /usr/local/tomcat/webapps2/
RUN mv /usr/local/tomcat/webapps.dist/ /usr/local/tomcat/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY context.xml /usr/local/tomcat/conf/
COPY tomcat.service /etc/systemd/system/

RUN cd /usr/local/tomcat/bin/
RUN /usr/local/tomcat/bin/shutdown.sh 
RUN /usr/local/tomcat/bin/startup.sh 

ADD sample.war /usr/local/tomcat/webapps/
ADD jenkins.war /usr/local/tomcat/webapps/

RUN apt -y update
RUN apt -y install git

CMD ["catalina.sh", "run"]