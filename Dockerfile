#FROM openjdk:17-slim-buster
FROM registry.access.redhat.com/ubi8/openjdk-17

#USER jboss
#RUN mkdir -p /deployments/image && chown -R jboss:0 /deployments
#EXPOSE 8080
CMD sh -c "echo 'Inside Container:' && echo 'User: $(whoami) UID: $(id -u) GID: $(id -g)'"

ARG JAR_FILE=./target/spring-hello-world-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} /deployments/app.jar
CMD ["java", "-jar", "/deployments/application.jar", "--spring.config.location=file:///deployments/config/application.properties"]
#ENTRYPOINT ["java","-jar","/app.jar"]