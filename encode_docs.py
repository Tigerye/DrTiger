# NOTE: First install bert-as-service via
# $
# $ pip install bert-serving-server
# $ pip install bert-serving-client
# $

#in shell
#bert-serving-start -model_dir /data/yechen/bert/chinese_L-12_H-768_A-12 -num_worker=4


from bert_serving.client import BertClient


if __name__ == '__main__':
    i = 0
    bc = BertClient()
    fout = open("test.txt",'w',encoding = 'utf-8')
    with open('/data/yechen/bert/wiki.zh.txt') as fin:
        for v in fin:
            i = i + 1
            doc = v.strip()
            vec = bc.encode([doc])[0]
            if (i <= 3):
                print('doc %d: %s\n' % (i, doc))
                print('vec %d: %s\n' % (i, vec))
                fout.write(" ".join(str(x) for x in vec))
                fout.write('\n')
            else:
                break
            
    fout.close()