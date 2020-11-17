#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import pickle
import numpy as np
from termcolor import colored
from rank_bm25 import BM25Okapi
import time
import json
import os
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

print('loading docs...')
tic = time.perf_counter()
with open('/data/yechen/bert/wiki.en.txt') as fin1:
    docs = fin1.readlines()
toc = time.perf_counter()
print('doc 1: %s' % docs[0])
print(f"Finished load [%d] docs in [{toc - tic:0.2f}] seconds\n" % len(docs))

print('building bm25...')
tic = time.perf_counter()
bm25 = BM25Okapi([doc.split(" ") for doc in docs])
toc = time.perf_counter()
print(f"Finished build bm25 on corpus with [{bm25.corpus_size}] documents and [{len(bm25.idf)}] vocabulary in [{toc - tic:0.2f}] seconds\n")

print('dumping bm25...')
tic = time.perf_counter()
with open("/data/yechen/bert/drtiger/bm25_en","rb") as fout:
    pickle.dump(bm25, fout)
toc = time.perf_counter()
print(f"Finished dump bm25 index in [{toc - tic:0.2f}] seconds\n")
        
    