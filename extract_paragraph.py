from gensim import utils
import json

# iterate over the plain text data we just created
output = open('/data/yechen/bert/wiki.en.para.txt', 'w',encoding='utf8')
with utils.smart_open('/data/yechen/bert/enwiki-20201101-pages-articles-multistream1.xml-p1p41242.json.gz', 'rb') as f:
    numart = 0
    numpar = 0
    for line in f:
        numart = numart+1
        article = json.loads(line)
        for section_text in zip(article['section_texts']):
            para_texts = ''.join(section_text).split("\\n\\n")
            for para_text in para_texts:
                numpar = numpar+1
                output.write(''.join(para_text)+"\n")
        if (numart > 2):
            break
output.close()
print(f"extracted [{numart}] articles and [{numpar}] paragraphs.\n")