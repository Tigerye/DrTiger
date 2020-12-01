import json
import requests

# infile = '/data/yechen/squad/dev-v2.0.json'
# outfile = '/data/yechen/squad/dev-v2.0-zh.json'

infile = '/data/yechen/squad/data/combined-squad-train-v2.0.json'
outfile = '/data/yechen/squad/data/combined-squad-train-v2.0-zh.json'

def trans(query):
    From = 'en'
    To = 'zh'
    data = {
        'q' : query,
        'from' : From,
        'to' : To
        }
    information = requests.post('https://aidemo.youdao.com/trans', data)
    result = information.json()
    error_code = result['errorCode']
    if (error_code=='0'):
        return result['translation'][0], error_code
    else: 
        return 'None', error_code

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
        
#         if (i > 0):
#             break
            
        if (i % 1000 ==0):
            print(f"translated [{i}] docs")
        
with open(outfile, 'w') as f:
    json.dump(data, f)
print(f"Finished translate [{i}] docs, [{j}] paragraphs ([{jb}] bad), [{k}] questions ([{kb}] bad) and [{l}] answers ([{lb}] bad)")