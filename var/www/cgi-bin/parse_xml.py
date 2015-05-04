#!/usr/local/bin/python2.6

import sys
import json
sys.path.insert(0, '/usr/local/lib/python2.6/site-packages')

import numpy as np
json1_file = open('test.json')
json1_str = json1_file.read()
json1_data = json.loads(json1_str)
datapoints = np.array(json1_data)
x = np.random.random(datapoints)
with printoptions(precision=3, suppress=True):
	print(x)
#avg = datapoints[0:5,0].mean()