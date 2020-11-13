import numpy as np
from termcolor import colored

i = 0
vecs = []
vecs = np.loadtxt('/data/yechen/bert/wiki.zh.vec.txt', delimiter=' ')
print("vecs length: "+len(vecs))