FROM debian:7.6
MAINTAINER jia.huang@geneegroup.com

ENV DEBIAN_FRONTEND noninteractive

# Install Tomcat 7
RUN apt-get update && apt-get install -y procps curl unzip mysql-client openjdk-7-jre-headless tomcat7

EXPOSE 8080

ADD start /start
CMD ["/start"]
