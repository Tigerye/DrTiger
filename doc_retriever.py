#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import jieba
from termcolor import colored
from rank_bm25 import BM25Okapi
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

print('loading docs...')
with open('/data/yechen/bert/wiki.zh.txt') as fin1:
    lines = fin1.readlines()
print('Finished load %d docs' % len(lines))
print('doc 1: %s' % lines[0])

print('loading tokenized docs...')
with open('/data/yechen/bert/wiki.zh.tokens.txt') as fin2:
    toklines = fin2.readlines()
print('Finished load %d tokenized docs' % len(toklines))
print('tokonized doc 1: %s' % toklines[0])

print('building bm25...')
corpus = []
for line in toklines:

while True:
    query = input(colored('your question: ', 'green'))
    query_vec = bc.encode([query])[0]
    # compute normalized dot product as score
    score = np.sum(query_vec * vecs, axis=1) / np.linalg.norm(vecs, axis=1)
    topk_idx = np.argsort(score)[::-1][:topk]
    print('top %d docs similar to "%s":' % (topk, colored(query, 'green')))
    for idx in topk_idx:
        print('> %s\t%s' % (colored('%.2f' % score[idx], 'cyan'), colored(docs[idx], 'yellow')))