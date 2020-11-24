from gensim import utils
import json
import re

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
            para_texts = section_text.replace("\n*","\n").strip('\n')
            paras = re.compile('\n+').split(para_texts)
            for para in paras:
                if not para:
                    numpar = numpar+1
                    output.write(''.join(para).replace("'''","").replace("''","").replace("===","").strip()+"\n")
        if (numart > 0):
            break
output.close()
print(f"extracted [{numart}] articles, [{numsec}] sections and [{numpar}] paragraphs.\n")