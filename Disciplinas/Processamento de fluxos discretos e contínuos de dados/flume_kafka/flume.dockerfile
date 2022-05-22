FROM ubuntu:latest

USER root

# Setup OpenJDK

# Install Java
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/cache/oracle-jdk8-installer;

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN  apt-get update \
  && apt-get install -y wget 

# Setup Flume -------------------------------------------------------------------------------
ENV FLUME_HOME=/root/flume
ENV PATH=$PATH:$FLUME_HOME/bin:.
ENV PATH = /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN wget http://apache.mirrors.ovh.net/ftp.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz && \
	tar -xzvf apache-flume-1.9.0-bin.tar.gz -C /root/ && \ 
	mv /root/apache-flume-1.9.0-bin /root/flume && \ 
    rm -rf /var/lib/apt/lists/* && \
	rm -rf apache-flume-1.9.0-bin.tar.gz

EXPOSE 40000

