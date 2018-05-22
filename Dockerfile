FROM openjdk:8-jre-alpine

WORKDIR /
COPY eureka.jar /
EXPOSE 8761

CMD ["java","-jar","eureka.jar"]

