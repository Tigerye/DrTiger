import logging
import sys
import time
import pickle
#import hickle
#from rank_bm25 import BM25Okapi as BM25
from rank_bm25 import BM25Plus as BM25
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python build_index_en.py /data/yechen/bert/wiki.en.article.txt /data/yechen/bert/drtiger/bm25_en_article")
    
if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile, outfile = sys.argv[1:3]
    
    print('loading tokenized docs...')
    tic = time.perf_counter()
    with open(infile) as fin:
        docs = fin.readlines()
        #lower docs for uncased bert and uncased search
        docs = [doc.lower() for doc in docs]
    toc = time.perf_counter()
    print('tokonized doc 1: %s' % docs[0])
    print(f"Finished load [%d] tokenized docs in [{toc - tic:0.2f}] seconds\n" % len(docs))
    
    print('building bm25...')
    tic = time.perf_counter()
    bm25 = BM25([doc.split(" ") for doc in docs])
    toc = time.perf_counter()
    print(f"Finished build bm25 on corpus with [{bm25.corpus_size}] documents and [{len(bm25.idf)}] vocabulary in [{toc - tic:0.2f}] seconds\n")
    
    print('dumping bm25...')
    tic = time.perf_counter()
    with open(outfile,"wb") as fout:
        pickle.dump(bm25, fout, protocol=2)
        #hickle.dump(bm25, fout, mode='w')
    toc = time.perf_counter()
    print(f"Finished dump bm25 index in [{toc - tic:0.2f}] seconds\n")