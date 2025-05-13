# syntax=docker/dockerfile:1

FROM openjdk:8u312-jre-buster

LABEL version="3.1.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Infinity Evolved 1.7"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/42/42668516bb6cf534fe808d18c687b7292f624a1e11c0e0fd9a10ed60f93371ea.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://InfinityEvolved1.7:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Infinity Evolved 1.7 v3.1.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx4096m"

CMD ["/launch.sh"]