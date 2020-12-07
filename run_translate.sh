#!/bin/bash

#proxy
 
#nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/train-v2.0.json /data/yechen/squad/data/train-v2.0_zh.json > log-tran-train_relay.txt &

#nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/dev-v2.0.json /data/yechen/squad/data/dev-v2.0_zh.json > log-tran-dev_relay.txt &

#nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc160.train.json /data/yechen/squad/data/mctest_to_squad_mc160.train_zh.json > log-mc160-train.txt &

#nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc160.dev.json /data/yechen/squad/data/mctest_to_squad_mc160.dev_zh.json > log-mc160-dev.txt &

#nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc500.train.json /data/yechen/squad/data/mctest_to_squad_mc500.train_zh.json > log-mc500-train.txt &

#nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc500.dev.json /data/yechen/squad/data/mctest_to_squad_mc500.dev_zh.json > log-mc500-dev.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/newsqa_to_squad_train.json /data/yechen/squad/data/newsqa_to_squad_train_zh.json > log-newsqa-train_relay.txt &

#nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/newsqa_to_squad_dev.json /data/yechen/squad/data/newsqa_to_squad_dev_zh.json > log-newsqa-dev_relay.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/qangaroo_to_squad_medhop_train.json /data/yechen/squad/data/qangaroo_to_squad_medhop_train_zh.json > log-qangroo-med-train_relay.txt &

#nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/qangaroo_to_squad_medhop_dev.json /data/yechen/squad/data/qangaroo_to_squad_medhop_dev_zh.json > log-qangroo-med-dev_relay.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/qangaroo_to_squad_wikihop_train.json /data/yechen/squad/data/qangaroo_to_squad_wikihop_train_zh.json > log-qangroo-wiki-train_relay.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/qangaroo_to_squad_wikihop_dev.json /data/yechen/squad/data/qangaroo_to_squad_wikihop_dev_zh.json > log-qangroo-wiki-dev_relay.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/triviaqa_to_squad_web_train.json /data/yechen/squad/data/triviaqa_to_squad_web_train_zh.json > log-triviaqa-web-train_relay.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/triviaqa_to_squad_web_dev.json /data/yechen/squad/data/triviaqa_to_squad_web_dev_zh.json > log-triviaqa-web-dev_relay.txt &

nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/triviaqa_to_squad_wikipedia_train.json /data/yechen/squad/data/triviaqa_to_squad_wikipedia_train_zh.json > log-triviaqa-wikipedia-train_relay.txt &

#nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/triviaqa_to_squad_wikipedia_dev.json /data/yechen/squad/data/triviaqa_to_squad_wikipedia_dev_zh.json > log-triviaqa-wikipedia-dev_relay.txt &


nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/combined-squad-train-v2.0.json /data/yechen/squad/data/combined-squad-train-v2.0_zh.json > log-tran-combo-train-relay.txt &

#nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/combined-squad-dev-v2.0.json /data/yechen/squad/data/combined-squad-dev-v2.0_zh.json > log-tran-combo-dev-relay.txt &

