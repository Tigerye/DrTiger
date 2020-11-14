#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import jieba
import numpy as np
from termcolor import colored
from rank_bm25 import BM25Okapi
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

print('loading docs...')
with open('/data/yechen/bert/wiki.zh.txt') as fin1:
    docs = fin1.readlines()
print('Finished load %d docs' % len(docs))
print('doc 1: %s' % docs[0])

print('loading tokenized docs...')
with open('/data/yechen/bert/wiki.zh.tokens.txt') as fin2:
    corpus = fin2.readlines()
print('Finished load %d tokenized docs' % len(corpus))
print('tokonized doc 1: %s' % corpus[0])

print('building bm25...')
bm25 = BM25Okapi([doc.split(" ") for doc in corpus])
print('Finished build bm25 on corpus')

topk = 3
while True:
    query = input(colored('your question: ', 'green'))
    tokquery = jieba.cut(query)
    scores = bm25.get_scores(tokquery)
    topk_idx = np.argsort(scores)[::-1][:topk]
    print('top %d docs similar to "%s":' % (topk, colored(query, 'green')))
    for idx in topk_idx:
        print('> %s\t%s' % (colored('%.2f' % scores[idx], 'cyan'), colored(docs[idx], 'yellow')))