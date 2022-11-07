FROM openjdk:11
EXPOSE 8181
COPY target/*.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]