#!/bin/sh
# Start Command (ex. nohup java -jar [tardis-agent jar] --spring.config.location=[CONFIG_FILE]
rm -rf public
mkdir -p public
nohup $JAVA_HOME/bin/java -jar ./tardis-agent*.jar --spring.config.location=classpath:/application.properties,file:./tardis-agent.properties > tardis-agent.log 2>&1&