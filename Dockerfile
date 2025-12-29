FROM tomcat:10.1-jdk17-temurin

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the dist directory
# Ensure you build the project (e.g., using NetBeans or Maven) before running docker-compose
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
