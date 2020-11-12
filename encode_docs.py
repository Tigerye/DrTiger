from bert_serving.client import BertClient

if __name__ == '__main__':
    i = 0
    with open('/data/yechen/bert/wiki.zh.txt') as fp:
        for v in fp:
            i = i + 1
            doc = v.strip()
            if (i <= 3):
                print('doc %d: %s' % (i, doc))
            else:
                break