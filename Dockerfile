FROM debian:latest

MAINTAINER Hossein Rafiee (https://github.com/h-rafiee)

RUN apt-get update
RUN apt-get install -y wget gnupg gnupg1 gnupg2
RUN echo "deb http://debian.opennms.org/ stable main" >> /etc/apt/sources.list
RUN wget -O - http://debian.opennms.org/OPENNMS-GPG-KEY | apt-key add -
RUN apt-get update

RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" |  debconf-set-selections

RUN apt-get install -y --yes oracle-java8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

CMD ["bash"]
