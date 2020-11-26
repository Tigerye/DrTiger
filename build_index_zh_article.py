#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import jieba
import time
#import pickle
import hickle
#from rank_bm25 import BM25Okapi as BM25
from rank_bm25 import BM25Plus as BM25
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

print('loading tokenized docs...')
tic = time.perf_counter()
with open('/data/yechen/bert/wiki.zh.tokens.txt') as fin2:
    docs = fin2.readlines()
toc = time.perf_counter()
print('tokonized doc 1: %s' % docs[0])
print(f"Finished load [%d] tokenized docs in [{toc - tic:0.2f}] seconds\n" % len(corpus))

print('building bm25...')
tic = time.perf_counter()
bm25 = BM25([doc.split(" ") for doc in docs])
toc = time.perf_counter()
print(f"Finished build bm25 on corpus with [{bm25.corpus_size}] documents and [{len(bm25.idf)}] vocabulary in [{toc - tic:0.2f}] seconds\n")

print('dumping bm25...')
tic = time.perf_counter()
with open("/data/yechen/bert/drtiger/bm25_zh_article","wb") as fout:
    #pickle.dump(bm25, fout)
    hickle.dump(bm25, fout, mode='w')
toc = time.perf_counter()
print(f"Finished dump bm25 index in [{toc - tic:0.2f}] seconds\n")
    