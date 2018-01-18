##Base Image
FROM ubuntu:14.04
# Install Java.
RUN \
  apt-get update && apt-get -y install -y python-software-properties software-properties-common ssh vim net-tools && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

#SSH configuration
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/Port 22/port 222/' /etc/ssh/sshd_config
##Adduser
RUN useradd user && echo user:password | chpasswd
##Sudoers
RUN echo " user ALL=(ALL:ALL) ALL " >> /etc/sudoers
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD service ssh restart && bash

