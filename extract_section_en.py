from gensim import utils
import json
import re
import logging
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

# iterate over the plain text data we just created
output = open('/data/yechen/bert/wiki.en.section.txt', 'w',encoding='utf8')
exclude_sections = {'See also', 'References', 'Further reading', 'External links', 'Sources', 'Bibliography'}
with utils.smart_open('/data/yechen/bert/enwiki-20201101-pages-articles-multistream.json.gz', 'rb') as f:
    numart = 0
    numsec = 0
    for line in f:
        numart = numart+1
        article = json.loads(line)
        section_titles = article['section_titles']
        if not section_titles:
            continue
        i = -1
        for section_text in article['section_texts']:
            i = i+1
            if (section_titles[i] in exclude_sections):
                continue
            output_text = ''
            numsec = numsec+1
            section_text = section_text.replace("\n*","\n").strip('\n')
            para_texts = re.compile('\n+').split(section_text)
            for para_text in para_texts:
                text = ''.join(para_text).replace("'''","").replace("''","").replace("===","").replace("\n+"," ").strip('=').strip('*').strip()
                if text:
                    output_text = output_text + " " + text
            output.write(output_text+"\n")
        if (numart % 10000 == 0):
            logging.info("extracted "+str(numart) + " articles")
output.close()
logging.info("Finished extrqct "+str(numart) + " articles")
print(f"extracted [{numart}] articles and [{numsec}] sections.\n")
