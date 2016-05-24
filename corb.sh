#!/bin/bash

# Run MLCP with an options file
#
# To use this script, copy your CORB and XCC JARs to the lib directory under
# your project's home directory

# The first parameter is the options file to use
OPTIONS=$1

SCRIPT_DIR=`dirname $0`

CLASSPATH=${SCRIPT_DIR}/lib/marklogic-corb-2.2.1.jar:${SCRIPT_DIR}/lib/marklogic-xcc-8.0.4.2.jar

java \
  -cp $CLASSPATH \
  -DOPTIONS-FILE=$OPTIONS \
  com.marklogic.developer.corb.Manager