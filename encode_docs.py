# NOTE: First install bert-as-service via
# $
# $ pip install bert-serving-server
# $ pip install bert-serving-client
# $

#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
from bert_serving.client import BertClient


if __name__ == '__main__':
    i = 0
    bc = BertClient()
    fout = open('/data/yechen/bert/wiki.zh.vec.txt','w',encoding = 'utf-8')
    with open('/data/yechen/bert/wiki.zh.txt') as fin:
        for v in fin:
            i = i + 1
            doc = v.strip()
            vec = bc.encode([doc])[0]
            fout.write(" ".join(str(x) for x in vec))
            fout.write('\n')
            if (i % 10000 == 0):
                logging.info("Encode "+str(i) + " docs")
    fout.close()
    logging.info("Finished encode "+str(i) + " docs")