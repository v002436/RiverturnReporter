-------------------------------------------------------------------------
OpenReports-Tomcat 
-------------------------------------------------------------------------

The OpenReports-Tomcat bundle is a preconfigured demo installation of 
OpenReports that contains a sample database and example reports that 
illustrate many core OpenReports concepts.

The OpenReports-Tomcat bundle is configured to run on Windows in the
root directory of your hard drive (c:\openreports-tomcat). Any other
operating systems or directory locations will require configuration 
changes.

To get started, double-click on the startup.bat file in the 
openreports-tomcat directory. 

Login with a username/password combination of admin/admin or user/user.

If you are installing to another directory besides c:\openreports-tomcat,
you must set the BaseDirectory from the General Settings Administration 
page in order to run the sample reports. To run the OLAP samples, you
must also update datasources.xml in the reports folder to point to the 
full path to SampleData.mondrian.xml

If you are installing on Linux, you must start the database using 
start-database.sh from the database directory, and start Tomcat using
startup.sh from the tomcat/bin folder.

More information is available in the openreports-tomcat/openreports/docs
directory and online at http://oreports.com.

Please post any questions, comments or problems to the OpenReports
forum on SourceForge.

-------------------------------------------------------------------------
OpenReports, Copyright 2002-2009
http://www.oreports.com
-------------------------------------------------------------------------

