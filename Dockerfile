# build-stage
FROM maven:sapmachine AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# package-stage
#FROM openjdk:17-slim-buster
FROM registry.access.redhat.com/ubi8/openjdk-17

#USER jboss
#RUN mkdir -p /deployments/image && chown -R jboss:0 /deployments
#EXPOSE 8080

ARG JAR_FILE=/home/app/target/spring-hello-world-0.0.1-SNAPSHOT.jar
COPY --from=build ${JAR_FILE} /deployments/application.jar
CMD ["java", "-jar", "/deployments/application.jar", "--spring.config.location=file:///deployments/config/application.properties"]
#ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080