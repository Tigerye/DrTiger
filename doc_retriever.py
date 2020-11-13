#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

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

bc = BertClient()
topk = 5

while True:
    query = input(colored('your question: ', 'green'))
    query_vec = bc.encode([query])[0]
    # compute normalized dot product as score
    score = np.sum(query_vec * vecs, axis=1) / np.linalg.norm(vecs, axis=1)
    topk_idx = np.argsort(score)[::-1][:topk]
    print('top %d docs similar to "%s":' % (topk, colored(query, 'green')))
    for idx in topk_idx:
        print('> %s\t%s' % (colored('%.2f' % score[idx], 'cyan'), colored(docs[idx], 'yellow')))