FROM openjdk:17-jdk-slim
RUN mkdir /home/app
WORKDIR /home/app
COPY target/Sample-1.0-SNAPSHOT.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]