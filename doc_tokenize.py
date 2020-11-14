#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import jieba
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

print('loading docs...')
with open('/data/yechen/bert/wiki.zh.txt') as fin:
    lines = fin.readlines()
print('Finished load %d docs' % len(lines))
print('doc 1: %s' % lines[0])

i = 0
docs = []
print('tokenizing docs...')
with open('/data/yechen/bert/wiki.zh.tokens.txt','w',encoding = 'utf-8') as fout:
    for line in lines:
        i =i+1
        line = line.replace("\n"," ")
        line = ' '.join(line.split())
        tokens = jieba.cut(line)
        fout.write(" ".join(token for token in tokens))
        fout.write('\n')
        if (i % 10000 == 0):
            logging.info("Tokenize "+str(i) + " docs")
logging.info("Finished tokenize "+str(len(docs)) + " docs")