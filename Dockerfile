# === BUILD STAGE ===
FROM eclipse-temurin:21-jdk-jammy AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# === RUNTIME STAGE ===
FROM eclipse-temurin:21-jre-jammy AS runtime
WORKDIR /app
# Copy the JAR file from the 'builder' stage to the 'runtime' stage
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
