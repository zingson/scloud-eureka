FROM openjdk:8-jre-alpine

ENV VERSION=netflix-eureka-server-2.0.0.RC1
ENV NAME=eureka
ENV TAG=2.0.0.RC1

WORKDIR /
COPY eureka.jar ./
EXPOSE 8761

CMD ["java","-jar","eureka.jar"]

