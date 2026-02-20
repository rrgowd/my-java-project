# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Remove default webapps (optional, to avoid default ROOT app)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat's webapps folder
COPY target/userapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
