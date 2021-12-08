import json
from tqdm import tqdm

import pandas as pd
import numpy as np

import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

train = json.load(open('/data/yechen/squad/WebQA.v1.0/me_train.json', 'r'))
eval = json.load(open('/data/yechen/squad/WebQA.v1.0/me_validation.ir.json', 'r'))

def find_all(a, b):
    locs = []
    p = 0
    
    while True:
        q = a[p:].find(b)
        if q == -1:
            break
        else:
            locs.append(p + q)
            p = p + q + len(b)
    
    return locs

def get_df(ds):
    rows = []
    for kq, vq in tqdm(ds.items()):
        question = vq['question']
        
        for ke, ve in vq['evidences'].items():
            qas = []
            answers = ve['answer']
            if answers[0] == 'no_answer':
                rows.append({
                    'context': ve['evidence'],
                    'question': question, 
                    'answer': np.nan,
                    'answer_start': np.nan
                })
            else:
                for ans in answers:
                    for f in find_all(ve['evidence'], ans):
                        rows.append({
                            'context': ve['evidence'],
                            'question': question, 
                            'answer': ans,
                            'answer_start': f
                        })
            
    return pd.DataFrame(rows)

def get_data(ds):
    data = {
        "version": "v2.0",
        "data": [

        ]
    }
    
    for kq, vq in tqdm(ds.items()):
        question = vq['question']
        
        for ke, ve in vq['evidences'].items():
            qas = []
            answers = ve['answer']
            if answers[0] == 'no_answer':
                qas.append({
                    'question': question,
                    'id': ke,
                    'answers': [
                        ],
                    'is_impossible': True,
                })
            else:
                finds = []
                for ans in answers:
                    finds.extend(find_all(ve['evidence'][:1000], ans))
                if len(finds) > 0:
                    qas.append({
                        'question': question,
                        'id': ke,
                        'answers': [
                            {
                                'text': ans,
                                'answer_start': finds[0]
                            } 
                        ],
                        'is_impossible': False,
                    })
                else:
                    qas.append({
                        'question': question,
                        'id': ke,
                        'answers': [
                            ],
                        'is_impossible': True,
                    })
                    print(answers, ve['evidence'])
            
            d = {
                'title': ke,
                'paragraphs': [{
                    'context': ve['evidence'][:1000],
                    'qas': qas
                }]
            }
            data['data'].append(d)
    return data

train_data = get_data(train)
train_context_len = len(train_data['data'])
eval_data = get_data(eval)
eval_context_len = len(eval_data['data'])

json.dump(train_data, open('/data/yechen/squad/WebQA.v1.0/webqa_squad_train.json', 'w'), ensure_ascii=False)
print(f"Finished dump webqa-squad train data with [{train_context_len}] contexts\n")
json.dump(eval_data, open('/data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json', 'w'), ensure_ascii=False)
print(f"Finished dump webqa-squad eval data with [{eval_context_len}] contexts\n")


