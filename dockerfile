#
# Build Package
#
FROM maven:3.8.3-openjdk-17 AS build
COPY /JBS .
RUN mvn clean package -DskipTests --no-cache

#
#Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/JBS-0.1-SNAPSHOT.jar JBS.jar 
EXPOSE 9192
ENTRYPOINT ["java","-jar","JBS.jar"] 