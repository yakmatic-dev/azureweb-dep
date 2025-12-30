FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Create a non-root user and group
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Copy the already-built JAR from host
COPY --chown=spring:spring target/*.jar app.jar

# Expose the Spring Boot default port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
