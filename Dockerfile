FROM openjdk:11
EXPOSE 8181
ADD target/spring-k8-demo-0.0.1-SNAPSHOT.jar spring-k8s-demo.jar
ENTRYPOINT ["java","-jar","/spring-k8s-demo.jar"]