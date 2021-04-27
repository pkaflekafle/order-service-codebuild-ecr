FROM maven:3-alpine AS build-project
ADD . ./order-service
WORKDIR /order-service
RUN mvn clean install

FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /app
COPY --from=build-project ./order-service/target/order-service-*.jar ./order-service.jar
CMD ["java", "-jar", "order-service.jar"]
