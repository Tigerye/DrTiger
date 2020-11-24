from gensim import utils
import json
import re
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

# iterate over the plain text data we just created
output = open('/data/yechen/bert/wiki.en.sec.txt', 'w',encoding='utf8')
with utils.smart_open('/data/yechen/bert/enwiki-20201101-pages-articles-multistream1.xml-p1p41242.json.gz', 'rb') as f:
    numart = 0
    numsec = 0
    for line in f:
        numart = numart+1
        article = json.loads(line)
        output_text = ''
        for section_text in article['section_texts']:
            numsec = numsec+1
            section_text = section_text.replace("\n*","\n").strip('\n')
            para_texts = re.compile('\n+').split(section_text)
            for para_text in para_texts:
                text = ''.join(para_text).replace("'''","").replace("''","").replace("===","").replace("\n+"," ").strip('=').strip('*').strip()
                if text:
                    output_text.join(" "+text)
            output.write(output_text+"\n")
        if (numart > 0):
            break
        if (numart % 10000 == 0):
            logging.info("extracted "+str(numart) + " articles")
output.close()
logging.info("Finished extrqct "+str(numart) + " articles")
print(f"extracted [{numart}] articles and [{numsec}] sections.\n")
