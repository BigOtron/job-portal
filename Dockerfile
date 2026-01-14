FROM amazoncorretto:17
WORKDIR /usr/local/app
COPY target/job-portal-0.0.1-SNAPSHOT.jar ./
CMD ["java", "-jar", "job-portal-0.0.1-SNAPSHOT.jar"]