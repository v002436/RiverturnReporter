#!/bin/sh
/etc/init.d/httpd
/etc/init.d/mysqld start
export JAVA_HOME=/usr/

export BASEDIR=/usr/openreports-tomcat/
cd $BASEDIR/database

nohup ./start-database.sh &

cd ..

export CATALINA_HOME=$BASEDIR/tomcat

tomcat/bin/setclasspath.sh

nohup /usr/local/bin/python /usr/bin/luigid &

nohup tomcat/bin/catalina.sh run &


