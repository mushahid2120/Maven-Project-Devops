FROM adoptopenjdk/openjdk11
  
EXPOSE 8080
 
WORKDIR myapp

COPY target/*.jar ./app.jar


CMD ["java", "-jar", "app.jar"]
