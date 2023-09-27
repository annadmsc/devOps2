#
# Build Package
#
FROM maven:3.8.3-openjdk-17 AS build
COPY ./JBS-POC .
RUN mvn clean package -DskipTests

#
#Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/devOps2-0.0.1-SNAPSHOT.jar devOps2.jar
EXPOSE 9192
ENTRYPOINT ["java","-jar","devOps2.jar"]