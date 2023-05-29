FROM tomcat:8.0.20-jre8

COPY target/01-sonarnexus*.war /usr/local/tomcat/webapps/sonarnexus.war
