# docker_tomcat_jenkins - Docker -  using tomcat server and Jenkins
 

<p>An example of how I work with Docker, of course here is just an example.</p>
 
<ul>
<li>Tomcat:9</li>
<li>Java 11 - jdk11-openjdk</li>  
<li>Jenkins</li>  
</ul> 
</br>
</br>
# generate the image 
<p>  docker build -t docker_tomcat .</p>

# generate the container and release the port  
  docker run -it -p 8787:8080 docker_tomcat</p>

#  generate the conainder and stay logged into the server  
<p>  docker container run -it docker_tomcat:latest bash</p>
</br>
</br>

#  links test   
<p>  docker container run -it docker_tomcat:latest bash</p>
<p> http://localhost:8787/sample</p>
<p> http://localhost:8787/manager/html</p>
<p> http://localhost:8787/jenkins</p>
</br>
</br>

<p>for this example to work you have to download the war
jenkins.war and put together with the Dockerfile to download use
the link below:
link: https://updates.jenkins.io/download/war/
https://www.jenkins.io/download/
</p> 

<p>Following images of the examples:</p> 

<p>Following images of the examples of the jenkins:</p> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
<p>when creating the container you have to get the password that will be used in jenkins configuration</p> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins00.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins01.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins02.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins03.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins04.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/logojenkins05.png" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 



<p>Following images of the examples of the tomcat:</p> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/docker001.PNG" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/docker002.PNG" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/docker003.PNG" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/docker004.PNG" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/docker005.PNG" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
 <img src="https://github.com/sovanderlei/docker_tomcat_jenkins/blob/main/image/docker006.PNG" style="width:800px;height:600px;" 
alt="Minha Figura">
</br> 
</br> 
</br> 

#  Docker File
<p>For those who are absolute beginners in the Docker ecosystem, here are some of the explanations for the terms used in the docker file.
</p>
<p>FROM – It is the base image on top of which the entire container will run. In other words, you can say that it provides the environment for the container to run within the docker environment. In this case, ubuntu 16 has been used, but other alternatives can also be used, such as CentOS, alpine, etc. 
Install Perquisites – they are analogous to the basic tools, frameworks and libraries required for setting and running a development environment. The RUN command will execute the necessary installation, updating and upgradation related to installers such as java, tomcat, etc.</p>
<p>EXPOSE – This allows the user to expose the ports outside the container.</p>
<p>CMD – The default command prompt for the container. Without this, the container wouldn’t be able to execute commands and the container would not be able to run. It is analogous to loading a Linux system in your local machine, which would pack the command prompt and would start executing commands for loading the OS. Here Bash is the default shell.
Maintainer – It is an optional parameter in the Dockerfile. If you are testing for a local environment, it is not necessary. However, if you are maintaining images in the docker hub, then it identifies the chief maintainer for that particular image.</p>
<p>WORKDIR – It is the workspace where all the development and deployment of applications inside the container will take place.
To test our tomcat image, I am using a sample war file hosted on the GitHub repository. The war file contains a simple hello world program written in JSP. This JSP will be accessed when the image is built, and it is run as a container in the coming steps.</p>

# Syntax
<p>docker build -t [Name Of the Image]  .</p>
<p>In the above command syntax, dot (.) in the end represents the current working directory. It is preferred to add the docker hub username followed by the image name. This ensures easy to push and pull of the images in and from the docker hub and also easy to identify the image if uniform naming is used.</p>

#  Command Syntax
<p>docker container run -it -d --name [container name] -p port:port [image name]
The explanation for the command to run the image as a container are below:</p>
<p>
-d: Runs the container in the background. 
-it: Allows the user to have an ssh session with the container.
–name – This allows the user to specify the name for the container. Notice that the image name was given when we built the image in step 3. Now a container will be running using that image, so the container name has to be distinct. The reason is obvious a single image can be used to create multiple containers across various systems or in a single system. In a microservices environment, multiple containers could be spin up as per the demand using a single image. So the naming has to be unique to identify one container from the other. 
-p port: port – It enables port forwarding from the container to the host. 
image name: The name of the image that will be used to spin up the container. If not found locally, it will search the docker hub or repositories with the same name.</p>

