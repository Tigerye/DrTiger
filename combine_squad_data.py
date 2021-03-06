import json
import sys
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python combine_squad_data.py")
data_dir = '/data/yechen/squad/data/'

# infiles = {data_dir+'train-v2.0.json',
#            data_dir+'newsqa_to_squad_train.json',
#            data_dir+'triviaqa_to_squad_wikipedia_train.json',
#            data_dir+'triviaqa_to_squad_web_train.json',
#            data_dir+'qangaroo_to_squad_wikihop_train.json',
#            data_dir+'qangaroo_to_squad_medhop_train.json',
#            data_dir+'mctest_to_squad_mc500.train.json',
#            data_dir+'mctest_to_squad_mc160.train.json'
#            }
#    
# outfile = data_dir+'combined-squad-train-v2.0.json'

# infiles = {data_dir+'dev-v2.0.json',
#            data_dir+'newsqa_to_squad_dev.json',
#            data_dir+'triviaqa_to_squad_wikipedia_dev.json',
#            data_dir+'triviaqa_to_squad_web_dev.json',
#            data_dir+'qangaroo_to_squad_wikihop_dev.json',
#            data_dir+'qangaroo_to_squad_medhop_dev.json',
#            data_dir+'mctest_to_squad_mc500.dev.json',
#            data_dir+'mctest_to_squad_mc160.dev.json'
#            }
# outfile = data_dir+'combined-squad-dev-v2.0.json'

# infiles = {data_dir+'train-v2.0.json',
#            data_dir+'newsqa_to_squad_train.json',
#            data_dir+'triviaqa_to_squad_wikipedia_train.json',
#            data_dir+'triviaqa_to_squad_web_train.json',
#            data_dir+'mctest_to_squad_mc500.train.json',
#            data_dir+'mctest_to_squad_mc160.train.json'
#            }
#    
# outfile = data_dir+'combined-squad-train-v2.0-6data.json'

# infiles = {data_dir+'dev-v2.0.json',
#            data_dir+'newsqa_to_squad_dev.json',
#            data_dir+'triviaqa_to_squad_wikipedia_dev.json',
#            data_dir+'triviaqa_to_squad_web_dev.json',
#            data_dir+'mctest_to_squad_mc500.dev.json',
#            data_dir+'mctest_to_squad_mc160.dev.json'
#            }
# outfile = data_dir+'combined-squad-dev-v2.0-6data.json'

# infiles = {data_dir+'train-v2.0.json',
#            data_dir+'newsqa_to_squad_train.json',
#            data_dir+'triviaqa_to_squad_wikipedia_train.json',
#            data_dir+'triviaqa_to_squad_web_train.json',
#            data_dir+'qangaroo_to_squad_wikihop_train.json',
#            data_dir+'mctest_to_squad_mc500.train.json',
#            data_dir+'mctest_to_squad_mc160.train.json'
#            }
#     
# outfile = data_dir+'combined-squad-train-v2.0-7data.json'

# infiles = {data_dir+'dev-v2.0.json',
#            data_dir+'newsqa_to_squad_dev.json',
#            data_dir+'triviaqa_to_squad_wikipedia_dev.json',
#            data_dir+'triviaqa_to_squad_web_dev.json',
#            data_dir+'qangaroo_to_squad_wikihop_dev.json',
#            data_dir+'mctest_to_squad_mc500.dev.json',
#            data_dir+'mctest_to_squad_mc160.dev.json'
#            }
# outfile = data_dir+'combined-squad-dev-v2.0-7data.json'

# infiles = {'/data/yechen/squad/WebQA.v1.0/webqa_squad_train.json',
#            data_dir+'train-v2.0_zh.json'
#            }
#      
# outfile = data_dir+'combined-squad-train-v2.0-2data-zh.json'

# infiles = {data_dir+'webqa_squad_train.json',
#            data_dir+'train-v2.0_zh.json',
#            data_dir+'newsqa_to_squad_train_zh.json',
#            data_dir+'triviaqa_to_squad_wikipedia_train_zh.json',
#            data_dir+'triviaqa_to_squad_web_train_zh.json',
# #            data_dir+'qangaroo_to_squad_wikihop_train_zh.json',
#            data_dir+'mctest_to_squad_mc500.train_zh.json',
#            data_dir+'mctest_to_squad_mc160.train_zh.json'
#            }
#      
# outfile = data_dir+'combined-squad-train-v2.0-7data_zh.json'

infiles = {data_dir+'combined-squad-train-v2.0-2data-zh.json',
           data_dir+'du_squad_search_train.json',
           data_dir+'du_squad_zhidao_train.json',
           }
     
outfile = data_dir+'combined-squad-train-v2.0-3data_zh.json'


# infiles = {'/data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json',
#            data_dir+'dev-v2.0_zh.json'
#            }
# outfile = data_dir+'combined-squad-dev-v2.0-2data-zh.json'

if __name__ == '__main__':
    logging.info("running %s" % ' '.join(sys.argv))
    
    data = {
            "version": "v2.0",
            "data": [
                
                ]
            }
    
    i = 0
    for infile in infiles:
        with open(infile) as f:
            d = json.load(f)
        for doc in d["data"]:
            data['data'].append(doc)
            i+=1
        print(f"combined file: [{infile}]")
    
    with open(outfile, 'w') as f:
        json.dump(data, f)
    print(f"Finished combine squad data with [{i}] docs")