# Stage 1: Build với Maven
FROM maven:3.9.6-eclipse-temurin-11 AS build

WORKDIR /app
COPY . .
RUN mvn package -DskipTests

# Stage 2: Deploy lên Tomcat
FROM tomcat:9.0-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR từ target/ sang ROOT.war
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
