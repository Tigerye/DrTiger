import json
import sys
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python combine_squad_data.py /data/yechen/squad/train-v2.0.json /data/yechen/squad/newsqa/newsqa_to_squad_train.json /data/yechen/squad/squad-and-newsqa-train-v2.0.json")

if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile1, infile2, outfile = sys.argv[1:4]
    
    data = {
            "version": "v2.0",
            "data": [
                
                ]
            }
    
    i = 0
    with open(infile1) as f:
        d = json.load(f)
    data['data'].append(d["data"])
    i += len(d["data"])
    
    with open(infile2) as f:
        d = json.load(f)
    data['data'].append(d["data"])
    i += len(d["data"])
    
    with open(outfile, 'w') as f:
        json.dump(data, f)
    print(f"Finished combine squad data with [{i}] docs")