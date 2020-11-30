import json

infile='/data/yechen/squad/newsqa/combined-newsqa-data-v1.json'
outfile='/data/yechen/squad/newsqa/newsqa_to_squad_train.json'

with open(infile) as f:
    newsqa = json.load(f)

data = {
        "version": "v2.0",
        "data": [

        ]
    }
    
i = 0
j = 0
for doc in newsqa["data"]:
        i = i+1
        d_text = doc["text"]
        d_type = doc["type"]
        
        qas = []
        for question in doc["questions"]:
            j = j+1
            q_text = question["q"]
            if ('s' not in question["consensus"]):
                continue
            a_start = question["consensus"]["s"]
            a_end = question["consensus"]["e"]
            a_text = d_text[a_start:a_end-1]
            
            qas.append({
                'question': q_text,
                'id': str(j),
                'answers': [
                    {
                        "text": a_text,
                        "answer_start": a_start
                        }
                    ],
                'is_impossible': True,
                })
        
        d = {
            'title': "doc"+str(i),
            'paragraphs': [{
                'context': d_text,
                'qas': qas
                }]
            }
        
        data['data'].append(d)
        
        if (i % 1000 ==0):
            print(f"converted [{i}] docs\n")
        
with open(outfile, 'w') as f:
    json.dump(data, f)
print(f"Finished convert [{i}] docs and [{j}] questions\n")