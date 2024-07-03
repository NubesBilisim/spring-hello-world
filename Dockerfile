FROM openjdk:17-slim-buster
ARG JAR_FILE=target/spring-hello-world-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]