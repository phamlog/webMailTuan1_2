FROM tomcat:9.0-jdk11

# Xoá app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR do NetBeans build ra (trong dist)
COPY dist/webMailTuan1Buoi2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
