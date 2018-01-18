##Base Image
FROM ubuntu:16.04
# Install Java.
RUN set -x && \
  apt-get update && \
  apt-get -y install -y python-software-properties software-properties-common ssh vim net-tools && \
  add-apt-repository -y ppa:openjdk-r/ppa && \
  apt-get update && \
  apt-get install -y openjdk-7-jdk && \
  rm -rf /var/lib/apt/lists/* && \
  wget http://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz && \
  wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
  tar -xvf apache-tomcat-7.0.82.tar.gz && \
  tar -xvf apache-maven-3.3.9-bin.tar.gz && \
  rm -rf aapache-tomcat-7.0.82.tar.gz apache-maven-3.3.9-bin.tar.gz
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64 
ENV M2_HOME=/apache-maven-3.3.9 
ENV PATH=${M2_HOME}/bin:${PATH}
##copy project
COPY Spring3HibernateApp /root/Spring3HibernateApp
##Build project
RUN cd /root/Spring3HibernateApp && mvn clean package && \
    cp target/Spring3HibernateApp.war /apache-tomcat-7.0.82/webapps/
ENTRYPOINT /apache-tomcat-7.0.82/bin/startup.sh && bash
