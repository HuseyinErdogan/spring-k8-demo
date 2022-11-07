FROM openjdk:11
EXPOSE 8181
RUN cp target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]