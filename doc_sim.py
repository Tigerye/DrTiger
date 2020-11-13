#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import numpy as np
from termcolor import colored
from bert_serving.client import BertClient
import spacy
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

nlp = spacy.load("zh_core_web_sm")

print('loading docs...')
with open('/data/yechen/bert/wiki.zh.txt') as fin:
    lines = fin.readlines()
print('Finished load %d docs' % len(lines))
print('doc 1: %s' % lines[0])

i = 0
docs = []
print('nlping docs...')
for line in lines:
    i =i+1
    docs.append(nlp(line))
    if (i % 10000 == 0):
        logging.info("nlp process "+str(i) + " docs")
logging.info("Finished nlp process "+str(i) + " docs")