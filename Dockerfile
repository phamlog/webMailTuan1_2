# Sử dụng Tomcat chính thức
FROM tomcat:9.0-jdk11

# Xóa webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR đã build sẵn từ repo GitHub
COPY dist/webMailTuan1Buoi2.war /usr/local/tomcat/webapps/ROOT.war

# Expose cổng (Render tự map)
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
