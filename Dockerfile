# Stage 1: Build bằng Ant
FROM openjdk:11 AS build

WORKDIR /app
COPY . .

# Cài Ant để build WAR
RUN apt-get update && apt-get install -y ant && ant

# Stage 2: Deploy lên Tomcat
FROM tomcat:9.0-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR do Ant sinh ra trong dist/
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
