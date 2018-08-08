#!/bin/bash
cd /tmp/servlet
mvn clean install
cp /tmp/servlet/target/*.war /usr/local/tomcat/webapps/
/usr/local/tomcat/bin/catalina.sh  start
