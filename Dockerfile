FROM java:8-alpine
COPY cloud-eureka-1.0.1.jar /apps/
CMD java -jar /apps/cloud-eureka-1.0.1.jar