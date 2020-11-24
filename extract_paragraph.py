from gensim import utils
import json
import re
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

# iterate over the plain text data we just created
output = open('/data/yechen/bert/wiki.en.para.txt', 'w',encoding='utf8')
with utils.smart_open('/data/yechen/bert/enwiki-20201101-pages-articles-multistream1.xml-p1p41242.json.gz', 'rb') as f:
    numart = 0
    numsec = 0
    numpar = 0
    for line in f:
        numart = numart+1
        article = json.loads(line)
        for section_text in article['section_texts']:
            numsec = numsec+1
            section_text = section_text.replace("\n*","\n").strip('\n')
            para_texts = re.compile('\n+').split(section_text)
            for para_text in para_texts:
                text = ''.join(para_text).replace("'''","").replace("''","").replace("===","").strip('=').strip('*').strip()
                if text:
                    numpar = numpar+1
                    output.write(text+"\n")
        
        if (numart % 10000 == 0):
            logging.info("extracted "+str(numart) + " articles")
output.close()
print(f"extracted [{numart}] articles, [{numsec}] sections and [{numpar}] paragraphs.\n")
logging.info("Finished extrqct "+str(numart) + " articles")