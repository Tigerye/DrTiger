import logging
import sys
import jieba
import jieba.posseg as pseg
import numpy as np
from termcolor import colored
import pickle
#import hickle
#from rank_bm25 import BM25Okapi as BM25
from rank_bm25 import BM25Plus as BM25
import time
import json
import os
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python doc_retriever_zh.py /data/yechen/bert/wiki.zh.article.txt /data/yechen/bert/drtiger/bm25_zh_article")

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
    
if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    docfile, bm25file = sys.argv[1:3]
    
    exclude_pos = {'p', 'r', 'u', 'x', 'y'}
    
    print('loading docs...')
    tic = time.perf_counter()
    with open(docfile) as fin1:
        docs = fin1.readlines()
    toc = time.perf_counter()
    print('doc 1: %s' % docs[0])
    print(f"Finished load [%d] docs in [{toc - tic:0.2f}] seconds\n" % len(docs))

    print('loading bm25...')
    tic = time.perf_counter()
    with open(bm25file,"rb") as fin:
        bm25 = pickle.load(fin)
        #bm25 = hickle.load(fin)
    toc = time.perf_counter()
    print(f"Finished load bm25 on corpus with [{bm25.corpus_size}] documents and [{len(bm25.idf)}] vocabulary in [{toc - tic:0.2f}] seconds\n")
    
    topk = 100
    while True:
        query = input(colored('your question: ', 'green'))
        #tokquery = jieba.cut(query)
        tokquery = []
        words = pseg.cut(query)
        for word, flag in words:
            if (flag) and (word) and (flag[0] not in exclude_pos):
                tokquery.append(word)
        
        if not tokquery:
            continue
        print(f"your query is: [{query}] and cleaned tokenized query is: [{' '.join(tokquery)}].\n")
        
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
        json.dump(reader_data, open('/data/yechen/bert/drtiger/retrieved_zh.json', 'w'), ensure_ascii=False)
        print(f"Finished dump dr. tiger retrieved data for reader with [{num_doc}] docs\n")
    
        reader_cmd = 'python run_squad.py   --vocab_file=/data/yechen/bert/chinese_L-12_H-768_A-12/vocab.txt   --bert_config_file=/data/yechen/bert/chinese_L-12_H-768_A-12/bert_config.json   --init_checkpoint=/data/yechen/bert/chinese_L-12_H-768_A-12/bert_model.ckpt   --do_train=False   --train_file=/data/yechen/squad/WebQA.v1.0/webqa_squad_train.json   --do_predict=True   --predict_file=/data/yechen/bert/drtiger/retrieved_zh.json   --train_batch_size=8   --learning_rate=3e-5   --num_train_epochs=2.0   --max_seq_length=512   --doc_stride=128   --output_dir=/data/yechen/squad/WebQA.v1.0/squad_base/   --version_2_with_negative=True   --null_score_diff_threshold=-0.000835418701171875'
        print(f"os execute: [{reader_cmd}]\n")
        os.system(reader_cmd)
        print(f"done reader execute\n")

        with open('/data/yechen/squad/WebQA.v1.0/squad_base/nbest_predictions.json','r') as f:
            reader_pred_nbest = json.load(f)
        
        topa = 3
        reader_preds = []
        reader_probs = []
        reader_docids = []
    
        for i in range(num_doc):
            for a in reader_pred_nbest[str(i+1)]:
                if a['text']:
                    reader_preds.append(a['text'])
                    reader_probs.append(a['probability'])
                    reader_docids.append(i)
                    break
    
        topa_idx = np.argsort(reader_probs)[::-1][:topa]
    
        print(colored('detailed info:', 'grey'))
        print(colored('----------', 'grey'))
        print(colored('your query: \"%s\"' % query, 'magenta'), '; ', colored('retriever query: \"%s\"' % ' '.join(tokquery), 'blue'))
        for idx in topa_idx:
            print('> %s\t%s\t%s\t%s' % (colored('answer: %s' % reader_preds[idx], 'blue'), colored('retriever score: %.2f' % reader_scores[reader_docids[idx]], 'red'), colored('reader score: %.6e' % reader_probs[idx], 'red'), colored('doc: %s' % reader_docs[reader_docids[idx]], 'yellow')))
    
        print(colored('=================================','green'))
        print(colored('your query: \"%s\"' % query, 'magenta'))
        print(colored('dr.tiger answer: \"%s\"' % reader_preds[topa_idx[0]], 'blue'))
        print(colored('=================================','green'))
        
    