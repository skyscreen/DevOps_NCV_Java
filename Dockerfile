FROM ubuntu:latest
MAINTAINER refer by pwittchen for java 8, others by skyscreen
USER root

#install java8
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install oracle-java8-set-default
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

#install tomcat
RUN wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN mkdir /usr/local/tomcat
RUN cp -Rv /tmp/apache-tomcat-8.5.32/* /usr/local/tomcat/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run

#install maven
RUN wget -O /tmp/apache-maven-3.5.4-bin.tar.gz  http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
RUN cd /tmp && tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/ 
RUN ln -s /opt/apache-maven-3.5.4 /opt/maven 
RUN ln -s /opt/maven/bin/mvn /usr/local/bin 
ENV MAVEN_HOME /opt/maven   


#project
RUN mkdir /tmp/servlet
COPY . /tmp/servlet
RUN chmod +x /tmp/servlet/start.sh
CMD ["/bin/bash", /tmp/servlet/start.sh]