import json
import requests

infile = '/data/yechen/squad/dev-v2.0.json'
outfile = '/data/yechen/squad/dev-v2.0-zh.json'

def trans(query):
    From = 'en'
    To = 'zh'
    data = {
        'q' : query,
        'from' : From,
        'to' : To
        }
    information = requests.post('https://aidemo.youdao.com/trans',data)
    print(information.json())
    return information.json()['translation]']


data = {
        "version": "v2.0",
        "data": [

        ]
    }
with open(infile) as f:
    data_en = json.load(f)
    
f_version = data_en["version"]

i = 0
j = 0
k = 0
for doc in data_en["data"]:
        i = i+1
        doc_title = doc["title"]
        
        para = []
        for paragraph in doc["paragraphs"]:
            j = j+1
            para_text = trans(paragraph["context"])
            print(para_text)
            
            qas = []
            for question in paragraph["qas"]:
                k = k+1
                ques_text = question["question"]
                ques_id = question["id"]
                
                ans = []
                ques_imp = question["is_impossible"]
                for answer in question["answers"]:
                    ans_text = answer["text"]
                    ans_start = answer["answer_start"]
                    
                    ans.append({
                        "text": ans_text,
                        "answer_start": ans_start
                        })
                
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
        
        if (i > 0):
            break
            
        if (i % 1000 ==0):
            print(f"translated [{i}] docs")
        
with open(outfile, 'w') as f:
    json.dump(data, f)
print(f"Finished convert [{i}] docs, [{j}] paragraphs and [{k}] questions")