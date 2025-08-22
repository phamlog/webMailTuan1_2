FROM maven:3.8.7-openjdk-11 AS build

WORKDIR /app

# Copy source code
COPY . .

# Build WAR bằng Maven (nếu bạn dùng Ant thì cần cài ant thay cho maven)
RUN mvn package -DskipTests

# Stage 2: copy sang Tomcat
FROM tomcat:9.0-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR sinh ra
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
