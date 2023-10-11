# Build stage
FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

# Copying Maven wrapper files and pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copying source code
COPY src src

# Building the application
RUN ./mvnw install -DskipTests

# Extracting the application's dependencies
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Run stage
FROM eclipse-temurin:17-jdk-alpine

# Creating a volume for temporary files
VOLUME /tmp

# Exposing port 8082
EXPOSE 8082

# Setting the dependency directory as an argument
ARG DEPENDENCY=/workspace/app/target/dependency

# Copying the application's dependencies and classes
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# Setting the entrypoint for the container
ENTRYPOINT ["java","-Dserver.port=8082","-cp","app:app/lib/*","com.serv2.demo2.Demo2Application"]

# This Dockerfile defines a multi-stage build for a Spring Boot application.
# The first stage builds the application using Maven and extracts the dependencies.
# The second stage copies the dependencies and classes to the final image and sets the entrypoint.
