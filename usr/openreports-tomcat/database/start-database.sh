#!/bin/sh
# -----------------------------------------------------------------------------
# Start Hypersonic database
#
# -----------------------------------------------------------------------------

java -classpath hsql/hsqldb-1.7.3.jar org.hsqldb.Server -database.0 hsql/openreports -dbname.0 openreports -database.1 hsql/sample -dbname.1 sample  -port 9001 -silent true -trace false
