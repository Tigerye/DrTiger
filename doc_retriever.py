import numpy as np
from termcolor import colored

i = 0
vecs = []
vecs = np.loadtxt('/data/yechen/bert/wiki.zh.vec.txt', delimiter=' ')
print('Finished load %d doc vecs' % len(vecs))
print('vec 1: %s' % vecs[0])