import json

infile='/data/yechen/squad/newsqa/combined-newsqa-data-v1.json'
outfile_train='/data/yechen/squad/newsqa/newsqa_to_squad_train.json'
outfile_dev='/data/yechen/squad/newsqa/newsqa_to_squad_dev.json'

def clean_text(intext):
    return ' '.join(intext.replace('\n',' ').split())

with open(infile) as f:
    newsqa = json.load(f)

data_train = {
        "version": "v2.0",
        "data": [

        ]
    }

data_dev = {
        "version": "v2.0",
        "data": [

        ]
    }
    
i = 0
j = 0
for doc in newsqa["data"]:
        i = i+1
        d_text = doc["text"]
        d_text_new = clean_text(d_text)
        d_type = doc["type"]
        
        qas = []
        for question in doc["questions"]:
            j = j+1
            q_text = question["q"]
            q_text_new = clean_text(q_text)
            if ('s' in question["consensus"]):
                a_start = question["consensus"]["s"]
                a_end = question["consensus"]["e"]
                a_text = d_text[a_start:a_end-1]
                a_text_new = clean_text(a_text)
                a_start_new = d_text_new.find(a_text_new)
                
                if a_start_new != -1:
                    qas.append({
                    'question': q_text_new,
                    'id': str(j),
                    'answers': [
                        {
                            "text": a_text_new,
                            "answer_start": a_start_new
                            }
                        ],
                    'is_impossible': False,
                    })
                else:
                    qas.append({
                        'question': q_text_new,
                        'id': str(j),
                        'answers': [],
                        'is_impossible': True,
                        })
                
            else:
                qas.append({
                    'question': q_text_new,
                    'id': str(j),
                    'answers': [],
                    'is_impossible': True,
                    })
        
        d = {
            'title': "doc"+str(i),
            'paragraphs': [{
                'context': d_text_new,
                'qas': qas
                }]
            }
        
        if (d_type=="train"):
            data_train['data'].append(d)
        else:
            data_dev['data'].append(d)
        
        if (i % 1000 ==0):
            print(f"converted [{i}] docs")
        
with open(outfile_train, 'w') as f:
    json.dump(data_train, f)
with open(outfile_dev, 'w') as f:
    json.dump(data_dev, f)
print(f"Finished convert [{i}] docs and [{j}] questions")