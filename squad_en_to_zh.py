import json
import sys
import requests
import nltk
nltk.download('punkt')
from nltk import tokenize
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

from netease_trans import netease_trans

# infile = '/data/yechen/squad/dev-v2.0.json'
# outfile = '/data/yechen/squad/dev-v2.0-zh.json'

# infile = '/data/yechen/squad/data/combined-squad-train-v2.0.json'
# outfile = '/data/yechen/squad/data/combined-squad-train-v2.0-zh.json'

def help():
    print("Usage: python squad_en_to_zh.py /data/yechen/squad/dev-v2.0.json /data/yechen/squad/dev-v2.0-zh.json")

def trans(query):
    From = 'en'
    To = 'zh'
    data = {
        'q' : query,
        'from' : From,
        'to' : To
        }
#     information = requests.post('https://aidemo.youdao.com/trans', data)
#     result = information.json()
    result = json.loads(netease_trans(query).decode('utf-8'))
    error_code = result['errorCode']
    if (error_code=='0'):
        return result['translation'][0], error_code
    elif (error_code=='103'):
        qs = tokenize.sent_tokenize(query)
        ress = []
        for q in qs:
            d = {
                'q' : q,
                'from' : From,
                'to' : To
                }
#             info = requests.post('https://aidemo.youdao.com/trans', d)
#             res= info.json()
            res= json.loads(netease_trans(q).decode('utf-8'))
            
            
            error_code = res['errorCode']
            if (error_code=='0'):
                ress.append(res['translation'][0])
        if (ress):
            return ''.join(ress), '0'
        else:
            return '', error_code
    else:
        return '', error_code
    
if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile, outfile = sys.argv[1:3]
    
    data = {
        "version": "v2.0",
        "data": [
            
            ]
        }
    
    with open(infile) as f:
        data_en = json.load(f)

    i = 0
    j = 0
    k = 0
    jb = 0
    kb = 0
    l = 0
    lb = 0
    m = 0

    for doc in data_en["data"]:
        i = i+1
        doc_title = doc["title"]
        
        para = []
        for paragraph in doc["paragraphs"]:
            j = j+1
            para_text, error_code = trans(paragraph["context"])
            if (error_code!='0'):
                #error logging
                jb+=1
                print(f"[error_code]: {error_code}; [error/total paragraphs]: {jb}/{j}")
                continue
            
            qas = []
            for question in paragraph["qas"]:
                k = k+1
                ques_text, error_code = trans(question["question"])
                if (error_code!='0'):
                    kb+=1
                    print(f"[error_code]: {error_code}; [error/total questions]: {kb}/{k}.")
                    continue
                
                ques_id = question["id"]
                
                ans = []
                ques_imp = question["is_impossible"]
                for answer in question["answers"]:
                    l = l+1
                    ans_text, error_code = trans(answer["text"])
                    if (error_code!='0'):
                        lb+=1
                        print(f"[error_code]: {error_code}; [error/total answers]: {lb}/{l}.")
                        continue
                    ans_start = para_text.find(ans_text)
                    if (ans_start!=-1):
                        ans.append({
                            "text": ans_text,
                            "answer_start": ans_start
                            })
                if (not ans):
                    if (ques_imp==False):
                        m+=1
                        print(f"[error_code]: no_answer_after_trans; [error/total questions]: {m}/{k}.")
                    ques_imp = True
                    
                        
                
                qas.append({
                    'question': ques_text,
                    'id': str(ques_id),
                    'answers': ans,
                    'is_impossible': ques_imp,
                    })
            
            para.append({
                'qas': qas,
                'context': para_text
                })
        
        data['data'].append({
            'title': doc_title,
            'paragraphs': para
            })
        
        #debug
        if (i>0):
            break
            
        if (i % 1000 ==0):
            print(f"translated [{i}] docs")
        
    with open(outfile, 'w') as f:
        json.dump(data, f)
    print(f"Finished translate [{i}] docs, [{j}] paragraphs ([{jb}] bad), [{k}] questions ([{kb}] bad trans, 【{m}] no answer after trans) and [{l}] answers ([{lb}] bad)")