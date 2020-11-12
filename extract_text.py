import logging
import sys
from gensim.corpora import WikiCorpus
import opencc
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)
'''
    extract data from wiki dumps(*articles.xml.bz2) by gensim.
    @2019-3-26
'''
def help():
    print("Usage: python extract_text.py /data/yechen/bert/zhwiki-20201101-pages-articles-multistream.xml.bz2 /data/yechen/bert/wiki.zh.txt")
 
if __name__ == '__main__':
    if len(sys.argv) < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    inp, outp = sys.argv[1:3]
    i = 0
 
    output = open(outp, 'w',encoding='utf8')
    wiki = WikiCorpus(inp, lemmatize=False, dictionary={})
    converter = opencc.OpenCC('t2s.json')
    for text in wiki.get_texts():
        output.write(" ".join(converter.convert(text)) + "\n")
        i = i + 1
        if (i % 10000 == 0):
            logging.info("Save "+str(i) + " articles")
    output.close()
    logging.info("Finished saved "+str(i) + "articles")
