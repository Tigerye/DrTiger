import logging
import numpy as np
from termcolor import colored

i = 0
vecs = []
vecs = np.loadtxt('/data/yechen/bert/wiki.zh.vec.txt', delimiter=' ')
logging.info("Finished load "+str(len(vecs)) + " doc vecs")
print('vec 1: %s' % vecs[0])