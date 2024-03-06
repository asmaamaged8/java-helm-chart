# Use the official Tomcat image as base
FROM tomcat:9

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Create the directory if it doesn't exist
RUN mkdir -p /usr/local/tomcat/webapps/

# Copy the WAR file to the webapps directory
COPY target/hello-1.0.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Define the command to run when the container starts
CMD ["catalina.sh", "run"]
#

