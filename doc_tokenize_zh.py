#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=8 -max_seq_len=128

import logging
import sys
import jieba
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python doc_tokenize_zh.py /data/yechen/bert/wiki.zh.txt /data/yechen/bert/wiki.zh.tokens.txt")
 
if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile, outfile = sys.argv[1:3]
    
    print('loading docs...')
    with open(infile, 'rb') as fin:
        lines = [line.decode('utf-8','ignore').strip() for line in fin.readlines()]
    print('Finished load %d docs' % len(lines))
    print('doc 1: %s' % lines[0])
    
    print('tokenizing docs...')
    i = 0
    with open(outfile,'w',encoding = 'utf-8') as fout:
        for line in lines:
            i =i+1
            line = line.replace('\n',' ')
            tokens = jieba.cut(line)
            outline = ' '.join(token for token in tokens)
            outline = ' '.join(outline.split())
            fout.write(outline)
            fout.write('\n')
            
            if (i % 10000 == 0):
                logging.info("Tokenize "+str(i)+ " docs")
    
    logging.info("Finished tokenize "+str(i)+ " docs")




