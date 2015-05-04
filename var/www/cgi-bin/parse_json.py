#!/usr/local/bin/python2.6

import sys
import json
import csv
from csv import *

sys.path.insert(0, '/usr/local/lib/python2.6/site-packages')

def readAndWrite(inputFileName, primaryKey=""):
    input = open(inputFileName+".json")
    data = json.load(input)
    input.close()

    header = set()

    if primaryKey != "":
        outputFileName = inputFileName+"-"+primaryKey
        if inputFileName == "data":
            for i in data:
                for j in i["fields"].keys():
                    if j not in header:
                        header.add(j)
    else:
        outputFileName = inputFileName
        for k, v in data.iteritems():
            #print k, v
            for j in v.iterkeys():
                print j
                if j not in header:
                    header.add(j)

    #print 'HEADER:', header

    with open(outputFileName+".csv", 'wb') as output_file:
        fieldnames = list(header)
        fieldnames = header

        for x,v in data.iteritems():
            row_value = {}
            if primaryKey == "":
                for y in v.iterkeys():
                    yValue = v.get(y)
                    print yValue
                    if type(yValue) == int or type(yValue) == bool or type(yValue) == float or type(yValue) == list:
                        row_value[y] = str(yValue).encode('utf8')
                        #print row_value[y]
                    elif type(yValue) != dict:
                        row_value[y] = yValue.encode('utf8')
                        print '\t', row_value[y]


if '__main__' == __name__:
    readAndWrite("test")
