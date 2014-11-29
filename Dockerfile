FROM debian:7.6
MAINTAINER jia.huang@geneegroup.com

ENV DEBIAN_FRONTEND noninteractive

# Install Tomcat 7
RUN printf "%s\n%s\n" "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" \
    "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" \
    >  /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections && apt-get install -y procps oracle-java7-installer 
RUN apt-get install -y tomcat7 && \
    sed -i 's/#JAVA_HOME=.*/JAVA_HOME=\/usr\/lib\/jvm\/java-7-oracle\/jre/g' /etc/default/tomcat7

EXPOSE 8080

ADD start /start
CMD ["/start"]
