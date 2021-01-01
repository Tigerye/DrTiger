import logging
import sys
import time
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python build_index_zh.py /data/yechen/bert/wiki.zh.article.tokens.txt /data/yechen/bert/drtiger/bm25_zh_article")
    
if __name__ == '__main__':
    if len(sys.argv) < 2:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile = sys.argv[1]
    
    print('loading docs...')
    tic = time.perf_counter()
    with open(infile, 'rb') as fin:
        lines = [line.decode('utf-8','ignore').strip() for line in fin.readlines()]
        n = len(lines)
    toc = time.perf_counter()
    print('doc 1: %s' % lines[0])
    print(f"Finished load [%d] docs in [{toc - tic:0.2f}] seconds\n" % n)
    
    partn = 5000000
    numpart = n//partn+1
    print('splitting into', numpart, 'parts','...')
    
    i=0
    for p in range(numpart):
        print('writing part',p,'...')
        outfile=infile+'.part-'+str(p+1)+'/'+str(numpart)
        
        with open(outfile,'w',encoding = 'utf-8') as fout:
            for line in lines[partn*p:min(partn*(p+1),n)]:
                i =i+1
                fout.write(line)
                fout.write('\n')
            
                if (i % 10000 == 0):
                    logging.info("wrote "+str(i)+ " lines.")
    
    logging.info("Finished split "+str(numpart)+ " parts.")
    
        