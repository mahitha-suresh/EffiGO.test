FROM openjdk:17
ADD target/docker-demo.jar /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java","-jar","docker-demo.jar"]