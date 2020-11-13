import numpy as np
from termcolor import colored

i = 0
vecs = []
fin = open('/data/yechen/bert/wiki.zh.vec.txt','r')
for v in fin:
    i = i + 1
    vecs.append(eval(v.rstrip()))
    if (i < 3):
        print(vecs[i-1])
    else:
        break
fin.close()
print("vecs length: "+len(vecs))