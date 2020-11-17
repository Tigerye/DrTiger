#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import jieba
import numpy as np
from termcolor import colored
from rank_bm25 import BM25Okapi
import time
import json
import os
import pickle
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

print('loading docs...')
tic = time.perf_counter()
with open('/data/yechen/bert/wiki.zh.txt') as fin1:
    docs = fin1.readlines()
toc = time.perf_counter()
print('doc 1: %s' % docs[0])
print(f"Finished load [%d] docs in [{toc - tic:0.2f}] seconds\n" % len(docs))

print('loading bm25...')
tic = time.perf_counter()
with open("/data/yechen/bert/drtiger/bm25","rb") as fin:
    bm25 = pickle.load(fin)
toc = time.perf_counter()
print(f"Finished load bm25 on corpus with [{bm25.corpus_size}] documents and [{len(bm25.idf)}] vocabulary in [{toc - tic:0.2f}] seconds\n")

def get_data(question, docs):
    data = {
        "version": "v2.0",
        "data": [

        ]
    }
    
    i = 0
    for doc in docs:
        i = i+1
        qas = []
        qas.append({
            'question': question,
            'id': str(i),
            'answers': [
                ],
            'is_impossible': True,
            })
        d = {
            'title': "doc"+str(i),
            'paragraphs': [{
                'context': doc,
                'qas': qas
                }]
            }
        data['data'].append(d)
        
    return data


#topk = 3
topk = 1
while True:
    query = input(colored('your question: ', 'green'))
    tokquery = jieba.cut(query)
    scores = bm25.get_scores(tokquery)
    topk_idx = np.argsort(scores)[::-1][:topk]
    print('top %d docs similar to "%s":' % (topk, colored(query, 'green')))
    reader_docs = []
    reader_scores = []
    for idx in topk_idx:
        reader_docs.append(docs[idx])
        reader_scores.append(scores[idx])
        
    num_doc = len(reader_docs)
        
    reader_data = get_data(query, reader_docs)
    json.dump(reader_data, open('/data/yechen/bert/drtiger/retrieved.json', 'w'), ensure_ascii=False)
    print(f"Finished dump dr. tiger retrieved data for reader with [{num_doc}] docs\n")
    
    reader_cmd = 'python run_squad.py   --vocab_file=/data/yechen/bert/chinese_L-12_H-768_A-12/vocab.txt   --bert_config_file=/data/yechen/bert/chinese_L-12_H-768_A-12/bert_config.json   --init_checkpoint=/data/yechen/bert/chinese_L-12_H-768_A-12/bert_model.ckpt   --do_train=False   --train_file=/data/yechen/squad/WebQA.v1.0/webqa_squad_train.json   --do_predict=True   --predict_file=/data/yechen/bert/drtiger/retrieved.json   --train_batch_size=8   --learning_rate=3e-5   --num_train_epochs=2.0   --max_seq_length=512   --doc_stride=128   --output_dir=/data/yechen/squad/WebQA.v1.0/squad_base/   --version_2_with_negative=True   --null_score_diff_threshold=-0.000835418701171875'
    print(f"os execute: [{reader_cmd}]\n")
    os.system(reader_cmd)
    print(f"done reader execute\n")

    with open('/data/yechen/squad/WebQA.v1.0/squad_base/nbest_predictions.json','r') as f:
        reader_pred_nbest = json.load(f)
        
    reader_pred = []
    for i in range(num_doc):
        for a in reader_pred_nbest[str(i+1)]:
            if a['text']:
                reader_pred.append(a['text'])
                break
    
    for i in range(num_doc):
        print('> %s\t%s\t%s' % (colored('score: %.2f' % reader_scores[i], 'red'), colored('answer: %s' % reader_pred[i], 'blue'), colored('doc: %s' % reader_docs[i], 'yellow')))
    
        
    