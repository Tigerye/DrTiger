import json
import sys
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python squad_en_to_zh.py /data/yechen/squad/dev-v2.0.json /data/yechen/squad/dev-v2.0-zh.json")
    
if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile, outfile = sys.argv[1:3]
    
    data = {
        "version": "v1.1",
        "data": [
            
            ]
        }
    
    with open(infile) as f:
        data_in = json.load(f)
        
    i = 0 #doc
    j = 0 #paragraph
    k = 0 #question
    kt = 0

    for doc in data_in["data"]:
        i = i+1        
        para = []
        for paragraph in doc["paragraphs"]:
            j = j+1
            qas = []
            for question in paragraph["qas"]:
                k = k+1
                ques_imp = question["is_impossible"]
                if (ques_imp==True):
                    kt = kt+1
                    continue    
                qas.append(question)
            
            para.append({
                'qas': qas,
                'context': paragraph['context']
                })
        
        data['data'].append({
            'title':doc["title"],
            'paragraphs': para
            })
        
#         #debug
#         if (i>0):
#             break
            
        if (i % 1000 ==0):
            print(f"translated [{i}] docs")
        
    with open(outfile, 'w') as f:
        json.dump(data, f)
    print(f"Finished convert [{i}] docs, [{j}] paragraphs, [{k}] questions ([{kt}] no answers).")