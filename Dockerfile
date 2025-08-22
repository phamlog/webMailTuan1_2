# Base Tomcat
FROM tomcat:9.0-jdk11

# Xóa các app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR đã build sẵn (đưa vào ROOT.war)
COPY dist/webMailTuan1Buoi2.war /usr/local/tomcat/webapps/ROOT.war

# Expose cổng 8080 (Render sẽ tự map)
EXPOSE 8080

# Khởi chạy Tomcat
CMD ["catalina.sh", "run"]
