import numpy as np
from termcolor import colored

i = 0
vecs = []
docs = []
vecs = np.loadtxt('/data/yechen/bert/wiki.zh.vec.txt', delimiter=' ')
docs = np.load
print('Finished load %d doc vecs' % len(vecs))
print('vec 1: %s' % vecs[0])

with open('/data/yechen/bert/wiki.zh.txt') as fin:
    docs = fin.readlines()
print('Finished load %d docs' % len(docs))
print('doc 1: %s' % docs[0])