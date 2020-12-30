import logging
import sys
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s', level=logging.INFO)

def help():
    print("Usage: python clean_doc.py /data/yechen/bert/wiki.zh.section.txt /data/yechen/bert/wiki.zh.section.cln.txt")

if __name__ == '__main__':
    numarg=len(sys.argv)
    if numarg < 3:
        help()
        sys.exit(1)
    logging.info("running %s" % ' '.join(sys.argv))
    infile=sys.argv[1]
    outfile=sys.argv[2]
    
    docs=[]
    i=0
    j=0
    with open(infile, 'rb') as fin:
            for line in fin.readlines():
                i+=1
                line_cln=line.decode('utf-8','ignore').strip()
                if not line_cln:
                    j+=1
                    print("bad line:", line)
                else:
                    docs.append(line_cln)
            if (i % 10000 == 0):
                logging.info("cleaned "+str(i)+" lines, with "+str(j)+" bad.")
    
    with open(outfile,'w',encoding = 'utf-8') as fout:
        for line in docs:
            fout.write(line)
            fout.write('\n')
            
    logging.info("Finished clean "+str(i)+ " lines, with "+str(len(docs))+" clean, and "+str(j)+" bad.")
