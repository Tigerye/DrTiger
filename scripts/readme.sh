#retriever
python extract_text.py /data/yechen/bert/zhwiki-20201101-pages-articles-multistream.xml.bz2 /data/yechen/bert/wiki.zh.txt

python doc_tokenize.py

python build_index.py

python doc_retriever.py

THRESH=-0.000835418701171875


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/webqa_squad_train.json \
  --do_predict=True \
  --predict_file=/data/yechen/bert/drtiger/retrieved.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_base/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
 
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12_wikizh
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0

 python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/webqa_squad_train.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_base/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH


#reader
python webqa_squad.py

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/webqa_squad_train.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_base/ \
  --version_2_with_negative=True
  
  SQUAD_DIR=/data/yechen/squad/WebQA.v1.0
  
  python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/webqa_squad_eval.json $SQUAD_DIR/squad_base/predictions.json --na-prob-file $SQUAD_DIR/squad_base/null_odds.json
  
  {
  "exact": 60.03961921531943,
  "f1": 60.03961921531943,
  "total": 36346,
  "HasAns_exact": 60.03961921531943,
  "HasAns_f1": 60.03961921531943,
  "HasAns_total": 36346,
  "best_exact": 60.03961921531943,
  "best_exact_thresh": -0.000835418701171875,
  "best_f1": 60.03961921531943,
  "best_f1_thresh": -0.000835418701171875
}

THRESH=-0.000835418701171875
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/webqa_squad_train.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_base/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
 {
  "exact": 60.03961921531943,
  "f1": 60.03961921531943,
  "total": 36346,
  "HasAns_exact": 60.03961921531943,
  "HasAns_f1": 60.03961921531943,
  "HasAns_total": 36346,
  "best_exact": 60.03961921531943,
  "best_exact_thresh": -0.000835418701171875,
  "best_f1": 60.03961921531943,
  "best_f1_thresh": -0.000835418701171875
}

#zh self pre-train
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12_wikizh
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/webqa_squad_train.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_base_wikizh/ \
  --version_2_with_negative=True
  
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/webqa_squad_eval.json $SQUAD_DIR/squad_base_wikizh/predictions.json --na-prob-file $SQUAD_DIR/squad_base_wikizh/null_odds.json

{
  "exact": 61.302481703626256,
  "f1": 61.302481703626256,
  "total": 36346,
  "HasAns_exact": 61.302481703626256,
  "HasAns_f1": 61.302481703626256,
  "HasAns_total": 36346,
  "best_exact": 61.302481703626256,
  "best_exact_thresh": -0.0071294307708740234,
  "best_f1": 61.302481703626256,
  "best_f1_thresh": -0.0071294307708740234
}


#en
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True
 
 
 SQUAD_DIR=/data/yechen/squad
 
 python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_large/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large/null_odds.json
 
 {
  "exact": 77.99208287711615,
  "f1": 80.93055442571975,
  "total": 11873,
  "HasAns_exact": 73.1612685560054,
  "HasAns_f1": 79.04663844409066,
  "HasAns_total": 5928,
  "NoAns_exact": 82.80908326324642,
  "NoAns_f1": 82.80908326324642,
  "NoAns_total": 5945,
  "best_exact": 78.06788511749347,
  "best_exact_thresh": -3.926774024963379,
  "best_f1": 80.93055442571915,
  "best_f1_thresh": -2.835961937904358
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad
THRESH=-2.835961937904358
THRESH=-4.251452803611755

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH



  
 #retriever
python extract_text_en.py /data/yechen/bert/enwiki-20201101-pages-articles-multistream.xml.bz2 /data/yechen/bert/wiki.en.txt

python build_index_en.py

python doc_retriever_en.py

#en, xml to json
python -m gensim.scripts.segment_wiki -i -f /data/yechen/bert/enwiki-20201101-pages-articles-multistream.xml.bz2 -o /data/yechen/bert/enwiki-20201101-pages-articles-multistream.json.gz

python extract_paragraph.py

python build_index_paragraph.py



#zh article
python -m gensim.scripts.segment_wiki -i -f /data/yechen/bert/zhwiki-20201101-pages-articles-multistream.xml.bz2 -o /data/yechen/bert/zhwiki-20201101-pages-articles-multistream.json.gz

python extract_article_zh.py

python doc_tokenize_zh.py /data/yechen/bert/wiki.zh.article.txt /data/yechen/bert/wiki.zh.article.tokens.txt

python build_index_zh.py /data/yechen/bert/wiki.zh.article.tokens.txt /data/yechen/bert/drtiger/bm25_zh_article

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.article.txt /data/yechen/bert/drtiger/bm25_zh_article

#zh section
python extract_section_zh.py

python clean_doc.py /data/yechen/bert/wiki.zh.section.txt /data/yechen/bert/wiki.zh.section.cln.txt

python doc_tokenize_zh.py /data/yechen/bert/wiki.zh.section.cln.txt /data/yechen/bert/wiki.zh.section.cln.tokens.txt

python build_index_zh.py /data/yechen/bert/wiki.zh.section.cln.tokens.txt /data/yechen/bert/drtiger/bm25_zh_section

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.section.cln.txt /data/yechen/bert/drtiger/bm25_zh_section

#zh paragraph
python extract_paragraph_zh.py

python doc_tokenize_zh.py /data/yechen/bert/wiki.zh.paragraph.txt /data/yechen/bert/wiki.zh.paragraph.tokens.txt

python build_index_zh.py /data/yechen/bert/wiki.zh.paragraph.tokens.txt /data/yechen/bert/drtiger/bm25_zh_paragraph

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.paragraph.txt /data/yechen/bert/drtiger/bm25_zh_paragraph


#more index
./scripts/generate-news-doc.sh /mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh-36kr.list /data/yechen/bert/news-2020-zh-36kr.txt

python doc_tokenize_zh.py /data/yechen/bert/news-2020-zh-36kr.txt /data/yechen/bert/news-2020-zh-36kr.tokens.txt

python build_index_zh.py /data/yechen/bert/news-2020-zh-36kr.tokens.txt /data/yechen/bert/drtiger/bm25_zh_news-2020-36kr

python doc_retriever_zh.py /data/yechen/bert/news-2020-zh-36kr.txt /data/yechen/bert/drtiger/bm25_zh_news-2020-36kr

#en article
python -m gensim.scripts.segment_wiki -i -f /data/yechen/bert/enwiki-20201101-pages-articles-multistream.xml.bz2 -o /data/yechen/bert/enwiki-20201101-pages-articles-multistream.json.gz

python extract_article_en.py

python build_index_en.py /data/yechen/bert/wiki.en.article.txt /data/yechen/bert/drtiger/bm25_en_article

proxy; python doc_retriever_en.py /data/yechen/bert/wiki.en.article.txt /data/yechen/bert/drtiger/bm25_en_article

#en section
python extract_section_en.py

python build_index_en.py /data/yechen/bert/wiki.en.section.txt /data/yechen/bert/drtiger/bm25_en_section

proxy; python doc_retriever_en.py /data/yechen/bert/wiki.en.section.txt /data/yechen/bert/drtiger/bm25_en_section

#en paragraph
python extract_paragraph_en.py

python build_index_en.py /data/yechen/bert/wiki.en.paragraph.txt /data/yechen/bert/drtiger/bm25_en_paragraph

proxy; python doc_retriever_en.py /data/yechen/bert/wiki.en.paragraph.txt /data/yechen/bert/drtiger/bm25_en_paragraph



BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_newsqa_and_squad/ \
  --version_2_with_negative=True
  
python /data/yechen/squad/evaluate-v2.0.py /data/yechen/squad/squad-and-newsqa-dev-v2.0.json /data/yechen/squad/squad_2.0_large_newsqa_and_squad/predictions.json --na-prob-file /data/yechen/squad/squad_2.0_large_newsqa_and_squad/null_odds.json
{
  "exact": 4.359684457871769,
  "f1": 7.013416219729383,
  "total": 23832,
  "HasAns_exact": 0.2609710871506078,
  "HasAns_f1": 4.6043359211998665,
  "HasAns_total": 14561,
  "NoAns_exact": 10.797109265451407,
  "NoAns_f1": 10.797109265451407,
  "NoAns_total": 9271,
  "best_exact": 38.90147700570661,
  "best_exact_thresh": 0.0,
  "best_f1": 38.90147700570661,
  "best_f1_thresh": 0.0
}

  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_newsqa_and_squad/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_newsqa_and_squad/ \
  --version_2_with_negative=True
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json /data/yechen/squad/squad_2.0_large_newsqa_and_squad/predictions.json --na-prob-file /data/yechen/squad/squad_2.0_large_newsqa_and_squad/null_odds.json
{
  "exact": 6.417923018613661,
  "f1": 8.140470948076743,
  "total": 11873,
  "HasAns_exact": 0.43859649122807015,
  "HasAns_f1": 3.888632180586259,
  "HasAns_total": 5928,
  "NoAns_exact": 12.380151387720774,
  "NoAns_f1": 12.380151387720774,
  "NoAns_total": 5945,
  "best_exact": 50.07159100480081,
  "best_exact_thresh": 0.0,
  "best_f1": 50.07159100480081,
  "best_f1_thresh": 0.0
}
  


BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True

SQUAD_DIR=/data/yechen/squad
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_large/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large/null_odds.json

{
  "exact": 76.79609197338499,
  "f1": 80.0462693905031,
  "total": 11873,
  "HasAns_exact": 76.92307692307692,
  "HasAns_f1": 83.43275244153884,
  "HasAns_total": 5928,
  "NoAns_exact": 76.66947014297729,
  "NoAns_f1": 76.66947014297729,
  "NoAns_total": 5945,
  "best_exact": 77.94154805019792,
  "best_exact_thresh": -3.531118869781494,
  "best_f1": 80.82359781180813,
  "best_f1_thresh": -2.896860361099243
}
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_1-256/ \
  --version_2_with_negative=True
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json /data/yechen/squad/squad_2.0_large_1-256/predictions.json --na-prob-file /data/yechen/squad/squad_2.0_large_1-256/null_odds.json
  
{
  "exact": 71.36359807967658,
  "f1": 74.50801025860474,
  "total": 11873,
  "HasAns_exact": 70.6140350877193,
  "HasAns_f1": 76.91187682193203,
  "HasAns_total": 5928,
  "NoAns_exact": 72.11101766190076,
  "NoAns_f1": 72.11101766190076,
  "NoAns_total": 5945,
  "best_exact": 72.64381369493809,
  "best_exact_thresh": -5.825696803629398,
  "best_f1": 75.14291827357076,
  "best_f1_thresh": -4.04068648815155
}
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad



python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_1-256/ \
  --version_2_with_negative=True
  
#small bert, 745k question, en model
python combine_squad_data.py (for dev)
python combine_squad_data.py (for train)

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=11.664867222309113

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_745kq/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0.json $SQUAD_DIR/squad_2.0_base_745kq/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_745kq/null_odds.json
  
{
  "exact": 57.54448124470461,
  "f1": 62.63432912098324,
  "total": 38949,
  "HasAns_exact": 54.120199315277446,
  "HasAns_f1": 60.8401235528665,
  "HasAns_total": 29501,
  "NoAns_exact": 68.23666384419982,
  "NoAns_f1": 68.23666384419982,
  "NoAns_total": 9448,
  "best_exact": 57.55731854476367,
  "best_exact_thresh": 11.664867222309113,
  "best_f1": 62.6471664210426,
  "best_f1_thresh": 11.664867222309113
}

after thres

{
  "exact": 57.526509024621944,
  "f1": 62.96074212872548,
  "total": 38949,
  "HasAns_exact": 55.547269584081896,
  "HasAns_f1": 62.72187197626081,
  "HasAns_total": 29501,
  "NoAns_exact": 63.70660457239627,
  "NoAns_f1": 63.70660457239627,
  "NoAns_total": 9448,
  "best_exact": 57.58299314488177,
  "best_exact_thresh": 1.4170150756835938,
  "best_f1": 63.28129637743142,
  "best_f1_thresh": 2.7002601623535156
}

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=11.664867222309113

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_745kq/ \
  --version_2_with_negative=True
  
SQUAD_DIR=/data/yechen/squad
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_745kq/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_745kq/null_odds.json

{
  "exact": 65.50998062831634,
  "f1": 68.74654082735313,
  "total": 11873,
  "HasAns_exact": 67.0715249662618,
  "HasAns_f1": 73.55392699783432,
  "HasAns_total": 5928,
  "NoAns_exact": 63.952901597981494,
  "NoAns_f1": 63.952901597981494,
  "NoAns_total": 5945,
  "best_exact": 67.21974227238272,
  "best_exact_thresh": -2.7909293174743652,
  "best_f1": 69.63479751619361,
  "best_f1_thresh": -2.617643117904663
}

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=-2.617643117904663

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_745kq/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
SQUAD_DIR=/data/yechen/squad
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_745kq/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_745kq/null_odds.json
  
{
  "exact": 67.21974227238272,
  "f1": 69.63479751619354,
  "total": 11873,
  "HasAns_exact": 59.59851551956815,
  "HasAns_f1": 64.43555177290219,
  "HasAns_total": 5928,
  "NoAns_exact": 74.81917577796467,
  "NoAns_f1": 74.81917577796467,
  "NoAns_total": 5945,
  "best_exact": 67.21974227238272,
  "best_exact_thresh": -2.7909293174743652,
  "best_f1": 69.63479751619361,
  "best_f1_thresh": -2.617643117904663
}
  
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_newsqa_and_squad/ \
  --version_2_with_negative=True
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/squad-and-newsqa-dev-v2.0.json $SQUAD_DIR/squad_2.0_base_newsqa_and_squad/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_newsqa_and_squad/null_odds.json
 
{
  "exact": 59.63830144343739,
  "f1": 65.25936427299347,
  "total": 23832,
  "HasAns_exact": 52.345305954261384,
  "HasAns_f1": 61.54530384959967,
  "HasAns_total": 14561,
  "NoAns_exact": 71.09265451407614,
  "NoAns_f1": 71.09265451407614,
  "NoAns_total": 9271,
  "best_exact": 60.229942933870426,
  "best_exact_thresh": -1.464531421661377,
  "best_f1": 65.31330664162775,
  "best_f1_thresh": -0.15530109405517578
}

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=-1.4673495292663574

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_newsqa_and_squad/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_newsqa_and_squad/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_newsqa_and_squad/null_odds.json

{
  "exact": 68.05356691653331,
  "f1": 70.97923018603579,
  "total": 11873,
  "HasAns_exact": 66.07624831309042,
  "HasAns_f1": 71.93596491207855,
  "HasAns_total": 5928,
  "NoAns_exact": 70.02523128679563,
  "NoAns_f1": 70.02523128679563,
  "NoAns_total": 5945,
  "best_exact": 69.08953086835677,
  "best_exact_thresh": -2.3545119762420654,
  "best_f1": 71.56993117108308,
  "best_f1_thresh": -1.4673495292663574
}
after thres
{
  "exact": 68.98846121452034,
  "f1": 71.56993117108335,
  "total": 11873,
  "HasAns_exact": 62.41565452091768,
  "HasAns_f1": 67.58599743493102,
  "HasAns_total": 5928,
  "NoAns_exact": 75.54247266610597,
  "NoAns_f1": 75.54247266610597,
  "NoAns_total": 5945,
  "best_exact": 69.08953086835677,
  "best_exact_thresh": -2.3545119762420654,
  "best_f1": 71.56993117108308,
  "best_f1_thresh": -1.4673495292663574
}


BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True
  

SQUAD_DIR=/data/yechen/squad
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/squad-and-newsqa-dev-v2.0.json $SQUAD_DIR/squad_2.0_large/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large/null_odds.json

{
  "exact": 58.249412554548506,
  "f1": 64.88222782203086,
  "total": 23832,
  "HasAns_exact": 52.084334867110776,
  "HasAns_f1": 62.94026876276904,
  "HasAns_total": 14561,
  "NoAns_exact": 67.93226189192104,
  "NoAns_f1": 67.93226189192104,
  "NoAns_total": 9271,
  "best_exact": 59.105404498153746,
  "best_exact_thresh": -3.453949451446533,
  "best_f1": 64.9955146530021,
  "best_f1_thresh": -0.9217531681060791
}

on dev 2.0

{
  "exact": 76.96454139644571,
  "f1": 80.22681146823321,
  "total": 11873,
  "HasAns_exact": 76.90620782726046,
  "HasAns_f1": 83.44010333372664,
  "HasAns_total": 5928,
  "NoAns_exact": 77.02270815811606,
  "NoAns_f1": 77.02270815811606,
  "NoAns_total": 5945,
  "best_exact": 78.09315253095258,
  "best_exact_thresh": -3.926717519760132,
  "best_f1": 80.95729558668336,
  "best_f1_thresh": -2.832317590713501
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/squad-and-newsqa-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_1-256/ \
  --version_2_with_negative=True
  
SQUAD_DIR=/data/yechen/squad
 
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/squad-and-newsqa-dev-v2.0.json $SQUAD_DIR/squad_2.0_large_1-256/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_1-256/null_odds.json

{
  "exact": 54.45619335347432,
  "f1": 58.83589526760696,
  "total": 23832,
  "HasAns_exact": 40.86257811963464,
  "HasAns_f1": 48.030839641345864,
  "HasAns_total": 14561,
  "NoAns_exact": 75.80627763995254,
  "NoAns_f1": 75.80627763995254,
  "NoAns_total": 9271,
  "best_exact": 54.87160120845922,
  "best_exact_thresh": -3.6163704469799995,
  "best_f1": 58.88624773487726,
  "best_f1_thresh": 19.28821849822998
}

on dev 2.0

{
  "exact": 71.22041607007496,
  "f1": 74.40745167349645,
  "total": 11873,
  "HasAns_exact": 70.27665317139001,
  "HasAns_f1": 76.65986398775678,
  "HasAns_total": 5928,
  "NoAns_exact": 72.16148023549201,
  "NoAns_f1": 72.16148023549201,
  "NoAns_total": 5945,
  "best_exact": 72.50905415648951,
  "best_exact_thresh": -5.825696803629398,
  "best_f1": 75.08104368167005,
  "best_f1_thresh": -4.04068648815155
}



#better clean data
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_8data/ \
  --version_2_with_negative=True
  
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0.json $SQUAD_DIR/squad_2.0_base_8data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_8data/null_odds.json

{
  "exact": 56.298939693461016,
  "f1": 61.51059875143678,
  "total": 38951,
  "HasAns_exact": 53.499644103989425,
  "HasAns_f1": 60.380277665564314,
  "HasAns_total": 29503,
  "NoAns_exact": 65.04022015241321,
  "NoAns_f1": 65.04022015241321,
  "NoAns_total": 9448,
  "best_exact": 56.36312289800005,
  "best_exact_thresh": -0.6623964309692383,
  "best_f1": 61.528570048708204,
  "best_f1_thresh": 13.134628355503082
}


BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_8data/ \
  --version_2_with_negative=True
  
  
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_8data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_8data/null_odds.json
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

{
  "exact": 62.85690221510991,
  "f1": 66.14108029272549,
  "total": 11873,
  "HasAns_exact": 65.01349527665317,
  "HasAns_f1": 71.59126962137768,
  "HasAns_total": 5928,
  "NoAns_exact": 60.70647603027754,
  "NoAns_f1": 60.70647603027754,
  "NoAns_total": 5945,
  "best_exact": 65.16465931104186,
  "best_exact_thresh": -2.920848846435547,
  "best_f1": 67.47019035431424,
  "best_f1_thresh": -2.275866985321045
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad
THRESH=-2.275866985321045

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_8data/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_8data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_8data/null_odds.json
 
{
  "exact": 64.92040764760381,
  "f1": 67.47019035431408,
  "total": 11873,
  "HasAns_exact": 58.890013495276655,
  "HasAns_f1": 63.99689103859123,
  "HasAns_total": 5928,
  "NoAns_exact": 70.93355761143819,
  "NoAns_f1": 70.93355761143819,
  "NoAns_total": 5945,
  "best_exact": 65.16465931104186,
  "best_exact_thresh": -2.920848846435547,
  "best_f1": 67.47019035431424,
  "best_f1_thresh": -2.275866985321045
}

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_8data/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0.json $SQUAD_DIR/squad_2.0_large_8data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_8data/null_odds.json

{
  "exact": 5.278426741290339,
  "f1": 7.126387513414647,
  "total": 38951,
  "HasAns_exact": 0.525370301325289,
  "HasAns_f1": 2.96511948056184,
  "HasAns_total": 29503,
  "NoAns_exact": 20.120660457239627,
  "NoAns_f1": 20.120660457239627,
  "NoAns_total": 9448,
  "best_exact": 24.25611665939257,
  "best_exact_thresh": 0.0,
  "best_f1": 24.256669118432008,
  "best_f1_thresh": -6.67572021484375e-06
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_8data/ \
  --version_2_with_negative=True
  

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_large_8data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_8data/null_odds.json

{
  "exact": 11.597742777730986,
  "f1": 12.989454338091676,
  "total": 11873,
  "HasAns_exact": 0.45546558704453444,
  "HasAns_f1": 3.24287978342821,
  "HasAns_total": 5928,
  "NoAns_exact": 22.70815811606392,
  "NoAns_f1": 22.70815811606392,
  "NoAns_total": 5945,
  "best_exact": 50.07159100480081,
  "best_exact_thresh": 0.0,
  "best_f1": 50.07247758071166,
  "best_f1_thresh": -6.67572021484375e-06
}

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=6 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data/ \
  --version_2_with_negative=True
  

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=12 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=6 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=256 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data/ \
  --version_2_with_negative=True

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json $SQUAD_DIR/squad_2.0_base_6data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_6data/null_odds.json

{
  "exact": 63.533452807646356,
  "f1": 68.9382733670431,
  "total": 33480,
  "HasAns_exact": 61.118043424007986,
  "HasAns_f1": 68.64459663624264,
  "HasAns_total": 24042,
  "NoAns_exact": 69.68637423182878,
  "NoAns_f1": 69.68637423182878,
  "NoAns_total": 9438,
  "best_exact": 63.86798088410992,
  "best_exact_thresh": -1.571187973022461,
  "best_f1": 69.03681016243057,
  "best_f1_thresh": -0.45794105529785156
}

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=-0.45794105529785156

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=6 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=256 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json $SQUAD_DIR/squad_2.0_base_6data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_6data/null_odds.json

{
  "exact": 23.43189964157706,
  "f1": 24.099944440712846,
  "total": 33480,
  "HasAns_exact": 0.2495632642874969,
  "HasAns_f1": 1.1798577437428315,
  "HasAns_total": 24042,
  "NoAns_exact": 82.48569612205976,
  "NoAns_f1": 82.48569612205976,
  "NoAns_total": 9438,
  "best_exact": 28.30047789725209,
  "best_exact_thresh": -14.147247716784477,
  "best_f1": 28.559290467697704,
  "best_f1_thresh": -13.736818790435791
}


BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=-2.4027998447418213

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=6 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=512 \
  --doc_stride=256 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_6data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_6data/null_odds.json


{
  "exact": 68.17990398382885,
  "f1": 71.3862868413801,
  "total": 11873,
  "HasAns_exact": 68.47165991902834,
  "HasAns_f1": 74.89362072667076,
  "HasAns_total": 5928,
  "NoAns_exact": 67.88898233809924,
  "NoAns_f1": 67.88898233809924,
  "NoAns_total": 5945,
  "best_exact": 69.40116230101911,
  "best_exact_thresh": -2.4027998447418213,
  "best_f1": 72.15119012539385,
  "best_f1_thresh": -2.1202192306518555
}

after thres

{
  "exact": 69.40116230101911,
  "f1": 72.0896424934547,
  "total": 11873,
  "HasAns_exact": 62.11201079622132,
  "HasAns_f1": 67.49668106018645,
  "HasAns_total": 5928,
  "NoAns_exact": 76.66947014297729,
  "NoAns_f1": 76.66947014297729,
  "NoAns_total": 5945,
  "best_exact": 69.40116230101911,
  "best_exact_thresh": -2.4027998447418213,
  "best_f1": 72.0896424934545,
  "best_f1_thresh": -2.4027998447418213
}


BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data_seq384/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json $SQUAD_DIR/squad_2.0_base_6data_seq384/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_6data_seq384/null_odds.json

{
  "exact": 63.51553166069295,
  "f1": 68.96710668370434,
  "total": 33480,
  "HasAns_exact": 60.48997587555112,
  "HasAns_f1": 68.08163762458898,
  "HasAns_total": 24042,
  "NoAns_exact": 71.22271667726213,
  "NoAns_f1": 71.22271667726213,
  "NoAns_total": 9438,
  "best_exact": 63.655913978494624,
  "best_exact_thresh": -0.5864834785461426,
  "best_f1": 69.00371232960289,
  "best_f1_thresh": -0.10068893432617188
}

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/dev-v2.0.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data_seq384/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_6data_seq384/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_6data_seq384/null_odds.json

{
  "exact": 68.65998483955192,
  "f1": 71.80480016162532,
  "total": 11873,
  "HasAns_exact": 68.20175438596492,
  "HasAns_f1": 74.50040356258008,
  "HasAns_total": 5928,
  "NoAns_exact": 69.11690496215307,
  "NoAns_f1": 69.11690496215307,
  "NoAns_total": 5945,
  "best_exact": 69.40958477217215,
  "best_exact_thresh": -2.0775861740112305,
  "best_f1": 72.2515722182484,
  "best_f1_thresh": -1.2833547592163086
}

BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad
THRESH=-2.0775861740112305

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/dev-v2.0.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data_seq384/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
 
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_6data_seq384/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_6data_seq384/null_odds.json

 
{
  "exact": 69.40958477217215,
  "f1": 72.10227325440705,
  "total": 11873,
  "HasAns_exact": 60.8974358974359,
  "HasAns_f1": 66.29053480930712,
  "HasAns_total": 5928,
  "NoAns_exact": 77.89739276703112,
  "NoAns_f1": 77.89739276703112,
  "NoAns_total": 5945,
  "best_exact": 69.40958477217215,
  "best_exact_thresh": -2.0775861740112305,
  "best_f1": 72.10227325440688,
  "best_f1_thresh": -2.0775861740112305
}
  
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-7data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-7data.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_7data_seq384/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json $SQUAD_DIR/squad_2.0_base_7data_seq384/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_7data_seq384/null_odds.json

{
  "exact": 62.75985663082437,
  "f1": 68.1104316662371,
  "total": 33480,
  "HasAns_exact": 59.46260710423426,
  "HasAns_f1": 66.91362000605478,
  "HasAns_total": 24042,
  "NoAns_exact": 71.15914388641662,
  "NoAns_f1": 71.15914388641662,
  "NoAns_total": 9438,
  "best_exact": 62.9778972520908,
  "best_exact_thresh": -0.6953344345092773,
  "best_f1": 68.13354140529691,
  "best_f1_thresh": -0.06380748748779297
}

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-7data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/dev-v2.0.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_7data_seq384/ \
  --version_2_with_negative=True
  
python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0.json $SQUAD_DIR/squad_2.0_base_7data_seq384/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_7data_seq384/null_odds.json

{
  "exact": 67.4724164069738,
  "f1": 70.63113872599955,
  "total": 11873,
  "HasAns_exact": 65.82321187584346,
  "HasAns_f1": 72.14971492810228,
  "HasAns_total": 5928,
  "NoAns_exact": 69.11690496215307,
  "NoAns_f1": 69.11690496215307,
  "NoAns_total": 5945,
  "best_exact": 68.52522530110335,
  "best_exact_thresh": -2.1512198448181152,
  "best_f1": 71.0609111181938,
  "best_f1_thresh": -0.6955504417419434
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-train-v2.0-6data.json $SQUAD_DIR/squad_2.0_large/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large/null_odds.json

{
  "exact": 59.1133574378175,
  "f1": 66.14826649904914,
  "total": 311422,
  "HasAns_exact": 53.801744257462225,
  "HasAns_f1": 63.081403410026006,
  "HasAns_total": 236089,
  "NoAns_exact": 75.75962725498785,
  "NoAns_f1": 75.75962725498785,
  "NoAns_total": 75333,
  "best_exact": 59.12266956091734,
  "best_exact_thresh": 17.978159427642822,
  "best_f1": 66.15757862212011,
  "best_f1_thresh": 17.978159427642822
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-6data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json $SQUAD_DIR/squad_2.0_large/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large/null_odds.json

{
  "exact": 51.84587813620072,
  "f1": 58.02933961294866,
  "total": 33480,
  "HasAns_exact": 46.539389401880044,
  "HasAns_f1": 55.15024915736964,
  "HasAns_total": 24042,
  "NoAns_exact": 65.36342445433354,
  "NoAns_f1": 65.36342445433354,
  "NoAns_total": 9438,
  "best_exact": 51.851851851851855,
  "best_exact_thresh": 7.989664435386658,
  "best_f1": 58.035313328599486,
  "best_f1_thresh": 7.989664435386658
}


BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-7data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_7data_seq384/ \
  --version_2_with_negative=True
  
  
{
  "exact": 62.55077658303465,
  "f1": 67.9419813654956,
  "total": 33480,
  "HasAns_exact": 59.17144996256551,
  "HasAns_f1": 66.67904234742274,
  "HasAns_total": 24042,
  "NoAns_exact": 71.15914388641662,
  "NoAns_f1": 71.15914388641662,
  "NoAns_total": 9438,
  "best_exact": 62.795698924731184,
  "best_exact_thresh": -0.6953344345092773,
  "best_f1": 67.97827453114775,
  "best_f1_thresh": -0.2893362045288086
}

BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0-7data.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_1-256/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/uncased_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/data/combined-squad-dev-v2.0-6data.json $SQUAD_DIR/squad_2.0_large_1-256/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_1-256/null_odds.json

{
  "exact": 47.00119474313023,
  "f1": 51.795649757201566,
  "total": 33480,
  "HasAns_exact": 36.83137842109642,
  "HasAns_f1": 43.50795914945138,
  "HasAns_total": 24042,
  "NoAns_exact": 72.90739563466836,
  "NoAns_f1": 72.90739563466836,
  "NoAns_total": 9438,
  "best_exact": 47.05495818399044,
  "best_exact_thresh": -0.8868400454521179,
  "best_f1": 51.819544619806116,
  "best_f1_thresh": 20.450010538101196
}


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v2.0-7data-zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_7data/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/combined-squad-dev-v2.0-7data-zh.json $SQUAD_DIR/squad_2.0_base_zh_7data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_7data/null_odds.json

{
  "exact": 70.45168716560441,
  "f1": 70.45222006693241,
  "total": 93826,
  "HasAns_exact": 53.10996983777615,
  "HasAns_f1": 53.110988831825225,
  "HasAns_total": 49068,
  "NoAns_exact": 89.46333616336744,
  "NoAns_f1": 89.46333616336744,
  "NoAns_total": 44758,
  "best_exact": 70.4527529682604,
  "best_exact_thresh": -0.002857208251953125,
  "best_f1": 70.45328586958838,
  "best_f1_thresh": -0.002857208251953125
}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_7data/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_base_zh_7data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_7data/null_odds.json

{
  "exact": 69.78017350290575,
  "f1": 69.78017350290575,
  "total": 11873,
  "HasAns_exact": 24.825550187869027,
  "HasAns_f1": 24.825550187869027,
  "HasAns_total": 3726,
  "NoAns_exact": 90.34000245489138,
  "NoAns_f1": 90.34000245489138,
  "NoAns_total": 8147,
  "best_exact": 70.44554872399561,
  "best_exact_thresh": -2.1671342849731445,
  "best_f1": 70.44554872399561,
  "best_f1_thresh": -2.1671342849731445
}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data
THRESH=-2.1671342849731445

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_7data/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_base_zh_7data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_7data/null_odds.json

{
  "exact": 70.44554872399561,
  "f1": 70.44554872399561,
  "total": 11873,
  "HasAns_exact": 17.954911433172303,
  "HasAns_f1": 17.954911433172303,
  "HasAns_total": 3726,
  "NoAns_exact": 94.45194550141156,
  "NoAns_f1": 94.45194550141156,
  "NoAns_total": 8147,
  "best_exact": 70.44554872399561,
  "best_exact_thresh": -2.1671342849731445,
  "best_f1": 70.44554872399561,
  "best_f1_thresh": -2.1671342849731445
}
  

ERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-7data-zh.json \
  --do_predict=True \
  --predict_file=/data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_7data/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py /data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json $SQUAD_DIR/squad_2.0_base_zh_7data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_7data/null_odds.json

{
  "exact": 70.8952627131282,
  "f1": 70.8952627131282,
  "total": 60351,
  "HasAns_exact": 59.1729488802069,
  "HasAns_f1": 59.1729488802069,
  "HasAns_total": 36346,
  "NoAns_exact": 88.64403249323058,
  "NoAns_f1": 88.64403249323058,
  "NoAns_total": 24005,
  "best_exact": 70.8952627131282,
  "best_exact_thresh": -0.002857208251953125,
  "best_f1": 70.8952627131282,
  "best_f1_thresh": -0.002857208251953125
}  
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_squaddata/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_base_zh_squaddata/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_squaddata/null_odds.json

{
  "exact": 70.17602964709846,
  "f1": 70.19287458940452,
  "total": 11873,
  "HasAns_exact": 30.703166935050994,
  "HasAns_f1": 30.756843800322063,
  "HasAns_total": 3726,
  "NoAns_exact": 88.2287958757825,
  "NoAns_f1": 88.2287958757825,
  "NoAns_total": 8147,
  "best_exact": 71.66680704118589,
  "best_exact_thresh": -2.2278084754943848,
  "best_f1": 71.67242202195457,
  "best_f1_thresh": -2.2278084754943848
}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/WebQA.v1.0

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=/data/yechen/squad/data/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=/data/yechen/squad/data/squad_2.0_base_zh_squaddata/ \
  --version_2_with_negative=True


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py /data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json $SQUAD_DIR/squad_2.0_base_zh_squaddata/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_squaddata/null_odds.json

{
  "exact": 62.97327301950258,
  "f1": 62.97327301950258,
  "total": 60351,
  "HasAns_exact": 52.24233753370385,
  "HasAns_f1": 52.24233753370385,
  "HasAns_total": 36346,
  "NoAns_exact": 79.22099562591127,
  "NoAns_f1": 79.22099562591127,
  "NoAns_total": 24005,
  "best_exact": 62.97161604613014,
  "best_exact_thresh": -0.003658771514892578,
  "best_f1": 62.97161604613014,
  "best_f1_thresh": -0.003658771514892578
}


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v2.0-2data-zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_2data/ \
  --version_2_with_negative=True
  
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/combined-squad-dev-v2.0-2data-zh.json $SQUAD_DIR/squad_2.0_base_zh_2data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_2data/null_odds.json

{
  "exact": 72.30837394771821,
  "f1": 72.30929700191994,
  "total": 72224,
  "HasAns_exact": 58.24765422239968,
  "HasAns_f1": 58.24931789445665,
  "HasAns_total": 40072,
  "NoAns_exact": 89.83266981836277,
  "NoAns_f1": 89.83266981836277,
  "NoAns_total": 32152,
  "best_exact": 72.30837394771821,
  "best_exact_thresh": -0.009885787963867188,
  "best_f1": 72.30929700191994,
  "best_f1_thresh": -0.009885787963867188
}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data
THRESH=-1.9015254974365234

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_2data/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_base_zh_2data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_2data/null_odds.json

{
  "exact": 71.2541059546871,
  "f1": 71.2597209354558,
  "total": 11873,
  "HasAns_exact": 27.80461621041331,
  "HasAns_f1": 27.822508498837,
  "HasAns_total": 3726,
  "NoAns_exact": 91.12556769362956,
  "NoAns_f1": 91.12556769362956,
  "NoAns_total": 8147,
  "best_exact": 71.5320475027373,
  "best_exact_thresh": -1.9015254974365234,
  "best_f1": 71.537662483506,
  "best_f1_thresh": -1.9015254974365234
}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_2data/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_base_zh_2data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_2data/null_odds.json

{
  "exact": 71.5320475027373,
  "f1": 71.537662483506,
  "total": 11873,
  "HasAns_exact": 22.517444981213096,
  "HasAns_f1": 22.535337269636784,
  "HasAns_total": 3726,
  "NoAns_exact": 93.9486927703449,
  "NoAns_f1": 93.9486927703449,
  "NoAns_total": 8147,
  "best_exact": 71.5320475027373,
  "best_exact_thresh": -1.9015254974365234,
  "best_f1": 71.537662483506,
  "best_f1_thresh": -1.9015254974365234
}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-2data-zh.json \
  --do_predict=True \
  --predict_file=/data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_zh_2data/ \
  --version_2_with_negative=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py /data/yechen/squad/WebQA.v1.0/webqa_squad_eval.json $SQUAD_DIR/squad_2.0_base_zh_2data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_base_zh_2data/null_odds.json

{
  "exact": 72.51578267137248,
  "f1": 72.51578267137248,
  "total": 60351,
  "HasAns_exact": 61.36851372915864,
  "HasAns_f1": 61.36851372915864,
  "HasAns_total": 36346,
  "NoAns_exact": 89.39387627577588,
  "NoAns_f1": 89.39387627577588,
  "NoAns_total": 24005,
  "best_exact": 72.51578267137248,
  "best_exact_thresh": -0.009885787963867188,
  "best_f1": 72.51578267137248,
  "best_f1_thresh": -0.009885787963867188
}


#v1.1
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v1.1-2data-zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_2data/
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v1.1.py $SQUAD_DIR/combined-squad-dev-v1.1-2data-zh.json $SQUAD_DIR/squad_1.1_base_zh_2data/predictions.json

{"exact_match": 80.32291874625673, "f1": 80.34221734211755}


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v1.1_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_2data/
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v1.1.py $SQUAD_DIR/dev-v1.1_zh.json $SQUAD_DIR/squad_1.1_base_zh_2data/predictions.json

{"exact_match": 57.43424584004294, "f1": 57.64179638575775}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/../WebQA.v1.0/webqa_squad_eval_v1.1.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_2data/

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

{"exact_match": 82.66934463214659, "f1": 82.66934463214659}


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v1.1-7data-zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_7data/
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v1.1.py $SQUAD_DIR/combined-squad-dev-v1.1-7data-zh.json $SQUAD_DIR/squad_1.1_base_zh_7data/predictions.json

{"exact_match": 74.0541931688665, "f1": 74.08664942747076}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v1.1_zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_7data/
 
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v1.1.py $SQUAD_DIR/dev-v1.1_zh.json $SQUAD_DIR/squad_1.1_base_zh_7data/predictions.json

{"exact_match": 56.387546967257116, "f1": 56.51458221506532}


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/../WebQA.v1.0/webqa_squad_eval_v1.1.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_7data/
 
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v1.1.py $SQUAD_DIR/../WebQA.v1.0/webqa_squad_eval_v1.1.json $SQUAD_DIR/squad_1.1_base_zh_7data/predictions.json

{"exact_match": 81.99526770483685, "f1": 81.99526770483685}

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python run_squad.py \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v1.1-7data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v1.1-7data-zh.json \
  --train_batch_size=8 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_1.1_base_zh_2data/
  
ERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v1.1.py $SQUAD_DIR/combined-squad-dev-v1.1-7data-zh.json $SQUAD_DIR/squad_1.1_base_zh_2data/predictions.json

{"exact_match": 64.76831256051081, "f1": 64.8118803387379}

#en to zh
proxy
 
nohup python squad_en_to_zh.py /data/yechen/squad/data/train-v2.0.json /data/yechen/squad/data/train-v2.0_zh.json > log-tran-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/dev-v2.0.json /data/yechen/squad/data/dev-v2.0_zh.json > log-tran-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc160.train.json /data/yechen/squad/data/mctest_to_squad_mc160.train_zh.json > log-mc160-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc160.dev.json /data/yechen/squad/data/mctest_to_squad_mc160.dev_zh.json > log-mc160-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc500.train.json /data/yechen/squad/data/mctest_to_squad_mc500.train_zh.json > log-mc500-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/mctest_to_squad_mc500.dev.json /data/yechen/squad/data/mctest_to_squad_mc500.dev_zh.json > log-mc500-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/newsqa_to_squad_train.json /data/yechen/squad/data/newsqa_to_squad_train_zh.json > log-newsqa-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/newsqa_to_squad_dev.json /data/yechen/squad/data/newsqa_to_squad_dev_zh.json > log-newsqa-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/qangaroo_to_squad_medhop_train.json /data/yechen/squad/data/qangaroo_to_squad_medhop_train_zh.json > log-qangroo-med-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/qangaroo_to_squad_medhop_dev.json /data/yechen/squad/data/qangaroo_to_squad_medhop_dev_zh.json > log-qangroo-med-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/qangaroo_to_squad_wikihop_train.json /data/yechen/squad/data/qangaroo_to_squad_wikihop_train_zh.json > log-qangroo-wiki-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/qangaroo_to_squad_wikihop_dev.json /data/yechen/squad/data/qangaroo_to_squad_wikihop_dev_zh.json > log-qangroo-wiki-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_web_train.json /data/yechen/squad/data/triviaqa_to_squad_web_train_zh.json > log-triviaqa-web-train.txt &
nohup python squad_en_to_zh_relay.py /data/yechen/squad/data/triviaqa_to_squad_web_train.json /data/yechen/squad/data/triviaqa_to_squad_web_train_zh.json > log-triviaqa-web-train-relay.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_web_dev.json /data/yechen/squad/data/triviaqa_to_squad_web_dev_zh.json > log-triviaqa-web-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_wikipedia_train.json /data/yechen/squad/data/triviaqa_to_squad_wikipedia_train_zh.json > log-triviaqa-wikipedia-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_wikipedia_dev.json /data/yechen/squad/data/triviaqa_to_squad_wikipedia_dev_zh.json > log-triviaqa-wikipedia-dev.txt &



#news index zh

cd /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020
find /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020 -type f -name news.txt -exec wc -c \{\} \; > news-2020-zh.list
./scripts/generate-news-doc.sh /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2020/news-2020-zh.list /data/yechen/bert/news.zh.2020.txt

python doc_tokenize_zh.py /data/yechen/bert/news.zh.2020.txt /data/yechen/bert/news.zh.2020.tokens.txt

python doc_split.py /data/yechen/bert/news.zh.2020.txt
python doc_split.py /data/yechen/bert/news.zh.2020.tokens.txt

for i in news.zh.2020.txt.part*; do outfile=`echo $i | sed 's/\.txt/.cln.txt/g'`; cat $i | sed 's/[[:blank:]]\+/ /g' > $outfile &;  done


cat news.zh.2020.txt.part1-4 | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' > news.zh.2020.cln.txt.part1-4

python build_index_zh.py /data/yechen/bert/news.zh.2020.tokens.txt.part1-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part1-4
python build_index_zh.py /data/yechen/bert/news.zh.2020.tokens.txt.part2-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part2-4
python build_index_zh.py /data/yechen/bert/news.zh.2020.tokens.txt.part3-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part3-4
python build_index_zh.py /data/yechen/bert/news.zh.2020.tokens.txt.part4-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part4-4

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.section.cln.txt /data/yechen/bert/drtiger/bm25_zh_section /data/yechen/bert/news.zh.2020.cln.txt.part1-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part1-4 /data/yechen/bert/news.zh.2020.cln.txt.part2-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part2-4 /data/yechen/bert/news.zh.2020.cln.txt.part3-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part3-4 /data/yechen/bert/news.zh.2020.cln.txt.part4-4 /data/yechen/bert/drtiger/bm25_zh_news-2020.part4-4


python build_index_zh.py /data/yechen/bert/news.zh.2019.tokens.txt /data/yechen/bert/drtiger/bm25_zh_news-2019

python doc_retriever_zh.py /data/yechen/bert/news.zh.2019.txt /data/yechen/bert/drtiger/bm25_zh_news-2019

cd /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2019
find /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2019 -type f -name news.txt -exec wc -c \{\} \; > news-2019-zh.list
./scripts/generate-news-doc.sh /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2019/news-2019-zh.list /data/yechen/bert/news.zh.2019.txt

python doc_tokenize_zh.py /data/yechen/bert/news.zh.2019.txt /data/yechen/bert/news.zh.2019.tokens.txt

python doc_split.py /data/yechen/bert/news.zh.2019.txt
python doc_split.py /data/yechen/bert/news.zh.2019.tokens.txt



cat news.zh.2019.txt.part3-3 | sed 's/[[:blank:]]\+/ /g' ｜ sed 's/\xe2\x80\x8b/ /g' > news.zh.2019.cln.txt.part3-3



python build_index_zh.py /data/yechen/bert/news.zh.2019.tokens.txt.part1-3 /data/yechen/bert/drtiger/bm25_zh_news-2019.part1-3
python build_index_zh.py /data/yechen/bert/news.zh.2019.tokens.txt.part2-3 /data/yechen/bert/drtiger/bm25_zh_news-2019.part2-3
python build_index_zh.py /data/yechen/bert/news.zh.2019.tokens.txt.part3-3 /data/yechen/bert/drtiger/bm25_zh_news-2019.part3-3




python doc_retriever_zh.py /data/yechen/bert/news.zh.2019.txt /data/yechen/bert/drtiger/bm25_zh_news-2019

cd /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2018
find /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2018 -type f -name news.txt -exec wc -c \{\} \; > news-2018-zh.list
./scripts/generate-news-doc.sh /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2018/news-2018-zh.list /data/yechen/bert/news.zh.2018.txt

python doc_tokenize_zh.py /data/yechen/bert/news.zh.2018.txt /data/yechen/bert/news.zh.2018.tokens.txt

python build_index_zh.py /data/yechen/bert/news.zh.2018.tokens.txt /data/yechen/bert/drtiger/bm25_zh_news-2018

python doc_retriever_zh.py /data/yechen/bert/news.zh.2017.txt /data/yechen/bert/drtiger/bm25_zh_news-2017

cd /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2017
find /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2017 -type f -name news.txt -exec wc -c \{\} \; > news-2017-zh.list
./scripts/generate-news-doc.sh /data/mnt/disk2/data1/news/datap/out-txt-v2/cn/2017/news-2017-zh.list /data/yechen/bert/news.zh.2017.txt

python doc_tokenize_zh.py /data/yechen/bert/news.zh.2017.txt /data/yechen/bert/news.zh.2017.tokens.txt

python build_index_zh.py /data/yechen/bert/news.zh.2017.tokens.txt /data/yechen/bert/drtiger/bm25_zh_news-2017

python doc_retriever_zh.py /data/yechen/bert/news.zh.2017.txt /data/yechen/bert/drtiger/bm25_zh_news-2017



python doc_retriever_zh.py /data/yechen/bert/wiki.zh.section.cln.txt /data/yechen/bert/drtiger/bm25_zh_section /data/yechen/bert/news.zh.2017.txt /data/yechen/bert/drtiger/bm25_zh_news-2017 /data/yechen/bert/news.zh.2018.txt /data/yechen/bert/drtiger/bm25_zh_news-2018


pre-train

cat news.zh.2020.txt | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' | sed 's/\xef\xbb\xbf/ /g' | sed 's/^【[0-9]\{8\}，[^【】]\+】//g' | sed 's/[^。！？!?]$/\0\n/g' | sed 's/[。！？!?]/\0\n/g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | head -n -1  > news.zh.2020.pre.txt

cat news.zh.2019.txt | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' | sed 's/\xef\xbb\xbf/ /g' | sed 's/^【[0-9]\{8\}，[^【】]\+】//g' | sed 's/[^。！？!?]$/\0\n/g' | sed 's/[。！？!?]/\0\n/g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | head -n -1  > news.zh.2019.pre.txt

cat news.zh.2018.txt | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' | sed 's/\xef\xbb\xbf/ /g' | sed 's/^【[0-9]\{8\}，[^【】]\+】//g' | sed 's/[^。！？!?]$/\0\n/g' | sed 's/[。！？!?]/\0\n/g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | head -n -1  > news.zh.2018.pre.txt

cat news.zh.2017.txt | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' | sed 's/\xef\xbb\xbf/ /g' | sed 's/^【[0-9]\{8\}，[^【】]\+】//g' | sed 's/[^。！？!?]$/\0\n/g' | sed 's/[。！？!?]/\0\n/g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | head -n -1 > news.zh.2017.pre.txt

cat wiki.zh.article.txt | sed 's/[[:blank:]]\+/ /g' | sed 's/\xe2\x80\x8b/ /g' | sed 's/\xef\xbb\xbf/ /g' | sed 's/[^。！？!?]$/\0\n/g' | sed 's/[。！？!?]/\0\n/g' | sed 's/^[[:blank:]]\+//g' | sed 's/[[:blank:]]\+$//g' | head -n -1 > wiki.zh.article.pre.txt


BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert

python create_pretraining_data.py \
  --input_file=$DATA_DIR/wiki.zh.article.pre.txt \
  --output_file=$DATA_DIR/tf_examples_wiki.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python create_pretraining_data.py \
  --input_file=$DATA_DIR/news.zh.2017.pre.txt \
  --output_file=$DATA_DIR/tf_examples_news2017.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert

python create_pretraining_data_v2.py \
  --input_file=$DATA_DIR/wiki.zh.article.pre.txt \
  --output_file=$DATA_DIR/tf_examples_wiki_seq512.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python create_pretraining_data_v2.py \
  --input_file=$DATA_DIR/news.zh.2017.pre.txt \
  --output_file=$DATA_DIR/tf_examples_news2017_seq512.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python create_pretraining_data.py \
  --input_file=$DATA_DIR/news.zh.2018.pre.txt \
  --output_file=$DATA_DIR/tf_examples_news2018.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python create_pretraining_data.py \
  --input_file=$DATA_DIR/news.zh.2019.pre.txt \
  --output_file=$DATA_DIR/tf_examples_news2019.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python create_pretraining_data.py \
  --input_file=$DATA_DIR/news.zh.2020.pre.txt \
  --output_file=$DATA_DIR/tf_examples_news2020.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True

BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
DATA_DIR=/data/yechen/bert

python run_pretraining_v2.py \
  --input_file=$DATA_DIR/tf_examples_news2017.tfrecord \
  --output_dir=$BERT_LARGE_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --train_batch_size=16 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=90000 \
  --num_warmup_steps=1000 \
  --learning_rate=2e-5
  
 
 
BERT_BASE_DIR=/data/yechen/bert/uncased_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert
  
python create_pretraining_data_v2.py \
  --input_file=./sample_text.txt \
  --output_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python create_pretraining_data.py \
  --input_file=./sample_text.txt \
  --output_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
python run_pretraining_v2.py \
  --input_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --output_dir=$DATA_DIR/bert_model_sample \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --train_batch_size=64 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=10000 \
  --num_warmup_steps=1000 \
  --learning_rate=2e-5
  
python run_pretraining_v2.py \
  --input_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --output_dir=$DATA_DIR/bert_model_sample \
  --do_train=False \
  --do_eval=True \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --train_batch_size=32 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=20 \
  --num_warmup_steps=10 \
  --learning_rate=2e-5
  
python run_pretraining.py \
  --input_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --output_dir=$DATA_DIR/bert_model_sample \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --train_batch_size=32 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=20 \
  --num_warmup_steps=10 \
  --learning_rate=2e-5
  
python run_pretraining.py \
  --input_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --output_dir=$DATA_DIR/bert_model_sample \
  --do_train=False \
  --do_eval=True \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --train_batch_size=32 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=20 \
  --num_warmup_steps=10 \
  --learning_rate=2e-5




BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh/ \
  --version_2_with_negative=True


#large zh bert
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_large_zh/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_zh/null_odds.json

{
  "exact": 72.30837394771821,
  "f1": 72.30929700191994,
  "total": 72224,
  "HasAns_exact": 58.24765422239968,
  "HasAns_f1": 58.24931789445665,
  "HasAns_total": 40072,
  "NoAns_exact": 89.83266981836277,
  "NoAns_f1": 89.83266981836277,
  "NoAns_total": 32152,
  "best_exact": 72.30837394771821,
  "best_exact_thresh": -0.009885787963867188,
  "best_f1": 72.30929700191994,
  "best_f1_thresh": -0.009885787963867188
}

{
  "exact": 67.53137370504506,
  "f1": 67.53137370504506,
  "total": 11873,
  "HasAns_exact": 3.2742887815351582,
  "HasAns_f1": 3.2742887815351582,
  "HasAns_total": 3726,
  "NoAns_exact": 96.91911132932368,
  "NoAns_f1": 96.91911132932368,
  "NoAns_total": 8147,
  "best_exact": 68.61787248378674,
  "best_exact_thresh": 0.0,
  "best_f1": 68.61787248378674,
  "best_f1_thresh": 0.0
}

BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
DATA_DIR=/data/yechen/bert

python run_pretraining_v2.py \
  --input_file=$DATA_DIR/tf_examples_wiki.tfrecord,$DATA_DIR/tf_examples_news2017.tfrecord \
  --output_dir=$BERT_LARGE_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --train_batch_size=16 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=1000000 \
  --num_warmup_steps=10000 \
  --learning_rate=2e-5
  
global_step = 1000000
loss = 1.9305431
masked_lm_accuracy = 0.6369072
masked_lm_loss = 1.8329065
next_sentence_accuracy = 0.96375
next_sentence_loss = 0.098514594

BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh/ \
  --version_2_with_negative=True


#large zh bert
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_large_zh/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_zh/null_odds.json

{
  "exact": 68.33993093573655,
  "f1": 68.34554591650524,
  "total": 11873,
  "HasAns_exact": 17.767042404723565,
  "HasAns_f1": 17.784934693147253,
  "HasAns_total": 3726,
  "NoAns_exact": 91.46925248557751,
  "NoAns_f1": 91.46925248557751,
  "NoAns_total": 8147,
  "best_exact": 69.62014655099806,
  "best_exact_thresh": -4.252739429473877,
  "best_f1": 69.62014655099806,
  "best_f1_thresh": -4.252739429473877
}
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
DATA_DIR=/data/yechen/bert

python run_pretraining_v2.py \
  --input_file=$DATA_DIR/tf_examples_wiki_seq512.tfrecord,$DATA_DIR/tf_examples_news2017_seq512.tfrecord \
  --output_dir=$BERT_LARGE_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/model.ckpt-1000000 \
  --train_batch_size=4 \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --num_train_steps=1100000 \
  --num_warmup_steps=1000 \
  --learning_rate=2e-5
  
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_large_zh/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_zh/null_odds.json


{
  "exact": 69.19902299334625,
  "f1": 69.19902299334625,
  "total": 11873,
  "HasAns_exact": 20.665593129361245,
  "HasAns_f1": 20.665593129361245,
  "HasAns_total": 3726,
  "NoAns_exact": 91.3956057444458,
  "NoAns_f1": 91.3956057444458,
  "NoAns_total": 8147,
  "best_exact": 70.1844521182515,
  "best_exact_thresh": -2.6207079887390137,
  "best_f1": 70.1844521182515,
  "best_f1_thresh": -2.6207079887390137
}


BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v2.0-2data-zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh_2data/ \
  --version_2_with_negative=True
  
python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/combined-squad-train-v2.0-2data-zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/combined-squad-dev-v2.0-2data-zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh_2data/ \
  --version_2_with_negative=True
  
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/combined-squad-dev-v2.0-2data-zh.json $SQUAD_DIR/squad_2.0_large_zh_2data/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_zh_2data/null_odds.json

{
  "exact": 65.9974523704032,
  "f1": 65.9974523704032,
  "total": 72224,
  "HasAns_exact": 46.656019165502094,
  "HasAns_f1": 46.656019165502094,
  "HasAns_total": 40072,
  "NoAns_exact": 90.10325951729286,
  "NoAns_f1": 90.10325951729286,
  "NoAns_total": 32152,
  "best_exact": 66.01406734603457,
  "best_exact_thresh": -0.03782176971435547,
  "best_f1": 66.01406734603457,
  "best_f1_thresh": -0.03782176971435547
}

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.section.cln.txt /data/yechen/bert/drtiger/bm25_zh_section
python doc_retriever_zh.py /data/yechen/bert/news.zh.2018.cln.txt /data/yechen/bert/drtiger/bm25_zh_news-2018

python doc_retriever_zh.py /data/yechen/bert/news.zh.2018.cln.txt /data/yechen/bert/drtiger/bm25_zh_news-2018 /data/yechen/bert/wiki.zh.section.cln.txt /data/yechen/bert/drtiger/bm25_zh_section

  
  
  #trim last empty line
  for i in `ls /data/yechen/bert/news.zh.2018.txt.pre.part*`; do cat $i | head -n -1 > "$i.cln"; echo "done $i.cln"; done
  
  for i in `ls /data/yechen/bert/news.zh.2019.txt.pre.part*`; do cat $i | head -n -1 > "$i.cln"; echo "done $i.cln"; done
  
  for i in `ls /data/yechen/bert/news.zh.2020.txt.pre.part*`; do cat $i | head -n -1 > "$i.cln"; echo "done $i.cln"; done
  

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert
  
python /home/yechen/Workspace/DrTiger/create_pretraining_data_v2.py \
  --input_file=/home/yechen/Workspace/DrTiger/sample_text.txt \
  --output_file=$DATA_DIR/tf_examples_sample.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert

python create_pretraining_data_v2.py \
  --input_file=$DATA_DIR/news.zh.2020.txt.pre.part4.cln \
  --output_file=$DATA_DIR/tf_examples_news2020part4.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
DATA_DIR=/data/yechen/bert

python run_pretraining_v2.py \
  --input_file=$DATA_DIR/tf_examples_*.tfrecord \
  --output_dir=$BERT_LARGE_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --train_batch_size=16 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=10000000 \
  --num_warmup_steps=100000 \
  --learning_rate=2e-5
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16_3M_1M
DATA_DIR=/data/yechen/bert

python run_pretraining_v2_gpu3.py \
  --input_file=$DATA_DIR/seq512/tf_examples_*.tfrecord \
  --output_dir=$BERT_LARGE_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --train_batch_size=4 \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --num_train_steps=1000000 \
  --num_warmup_steps=10000 \
  --learning_rate=2e-5
  

BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh_3.4M/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_large_zh_3.4M/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_zh_3.4M/null_odds.json

{
  "exact": 68.5841825991746,
  "f1": 68.5841825991746,
  "total": 11873,
  "HasAns_exact": 18.706387546967257,
  "HasAns_f1": 18.706387546967257,
  "HasAns_total": 3726,
  "NoAns_exact": 91.3956057444458,
  "NoAns_f1": 91.3956057444458,
  "NoAns_total": 8147,
  "best_exact": 69.92335551250737,
  "best_exact_thresh": -6.405576229095459,
  "best_f1": 69.92335551250737,
  "best_f1_thresh": -6.405576229095459
}
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16_3M_1M
SQUAD_DIR=/data/yechen/squad/data

python run_squad_v2.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh_3M_1M/ \
  --version_2_with_negative=True
  
python run_squad_nocache.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/train-v2.0_zh.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0_zh.json \
  --train_batch_size=4 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=384 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_zh_3M_1M/ \
  --version_2_with_negative=True
  
BERT_LARGE_DIR=/data/yechen/bert/chinese_L-24_H-1024_A-16
SQUAD_DIR=/data/yechen/squad/data

python /data/yechen/squad/evaluate-v2.0.py $SQUAD_DIR/dev-v2.0_zh.json $SQUAD_DIR/squad_2.0_large_zh_3M_1M/predictions.json --na-prob-file $SQUAD_DIR/squad_2.0_large_zh_3M_1M/null_odds.json

{
  "exact": 69.9991577528847,
  "f1": 70.01038771442208,
  "total": 11873,
  "HasAns_exact": 28.5829307568438,
  "HasAns_f1": 28.618715333691178,
  "HasAns_total": 3726,
  "NoAns_exact": 88.94071437338897,
  "NoAns_f1": 88.94071437338897,
  "NoAns_total": 8147,
  "best_exact": 71.03512170470816,
  "best_exact_thresh": -4.038878679275513,
  "best_f1": 71.03512170470816,
  "best_f1_thresh": -4.038878679275513
}


#python -m wikiextractor.WikiExtractor /data/yechen/bert/zhwiki-20201101-pages-articles-multistream.xml.bz2 --output /data/yechen/bert/zhwiki-extract/ --json
python -m wikiextractor.WikiExtractor /data/yechen/bert/zhwiki-20210201-pages-articles.xml.bz2 --output /data/yechen/bert/wiki-zh/ --json

#python scripts/retriever/build_db.py /data/yechen/bert/zhwiki-extract /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh.db --preprocess /home/yechen/Workspace/DrQA/scripts/retriever/prep_wikipedia_zh.py --num-workers 32 
python scripts/retriever/build_db.py /data/yechen/bert/wiki-zh /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh.db --preprocess /home/yechen/Workspace/DrQA/scripts/retriever/prep_wikipedia_zh.py --num-workers 32 

python ./scripts/retriever/split_ownthink.py /data/yechen/bert/ownthink_v2.txt /data/yechen/bert/wiki-ownthink/
python scripts/retriever/build_db.py /data/yechen/bert/wiki-ownthink /home/yechen/Workspace/DrQA/data/wikipedia/docs-ownthink-zh.db --preprocess /home/yechen/Workspace/DrQA/scripts/retriever/prep_wikipedia_ownthink.py --num-workers 32 


#python scripts/retriever/build_tfidf.py /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh.db /home/yechen/Workspace/DrQA/data/wikipedia/ --tokenizer 'jieba' --num-workers 32
python scripts/retriever/build_tfidf.py /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh.db /home/yechen/Workspace/DrQA/data/wikipedia/ --tokenizer 'spacyzh' --num-workers 32
#python scripts/retriever/build_tfidf.py /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh.db /home/yechen/Workspace/DrQA/data/wikipedia/ --tokenizer 'corenlpzh' --num-workers 32

python scripts/retriever/build_tfidf.py /home/yechen/Workspace/DrQA/data/wikipedia/docs-ownthink-zh.db /home/yechen/Workspace/DrQA/data/wikipedia/ --tokenizer 'spacyzh' --num-workers 32

#python scripts/retriever/interactive.py --model /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh-tfidf-ngram=2-hash=16777216-tokenizer=jieba.npz
python scripts/retriever/interactive.py --model /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh-tfidf-ngram=2-hash=16777216-tokenizer=spacyzh.npz --data /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh.db
#python scripts/retriever/interactive.py --model /home/yechen/Workspace/DrQA/data/wikipedia/docs-zh-tfidf-ngram=2-hash=16777216-tokenizer=corenlpzh.npz

#python scripts/retriever/interactive.py --model /home/yechen/Workspace/DrQA/data/wikipedia/docs-tfidf-ngram=2-hash=16777216-tokenizer=corenlp.npz

python scripts/retriever/interactive.py --model /home/yechen/Workspace/DrQA/data/wikipedia/docs-ownthink-zh-tfidf-ngram=2-hash=16777216-tokenizer=spacyzh.npz --data /home/yechen/Workspace/DrQA/data/wikipedia/docs-ownthink-zh.db

python scripts/retriever/squad_2.0_to_1.1.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v2.0-train-zh.json /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-train-zh.json
python scripts/retriever/squad_2.0_to_1.1.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v2.0-dev-zh.json /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-dev-zh.json

python scripts/retriever/process_evaldata.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-dev-zh.json /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-dev-zh.txt
python scripts/retriever/process_evaldata.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-train-zh.json /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-train-zh.txt

python scripts/retriever/process_evaldata.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v2.0-dev-zh.json /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v2.0-dev-zh.txt
python scripts/retriever/process_evaldata.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v2.0-train-zh.json /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v2.0-train-zh.txt

python scripts/retriever/eval.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-dev.txt \
	--model /home/yechen/Workspace/DrQA/data//wikipedia/docs-tfidf-ngram=2-hash=16777216-tokenizer=simple.npz \
	--doc-db /home/yechen/Workspace/DrQA/data//wikipedia/docs.db \
	--tokenizer 'simple' \
	--n-docs 5 \
	--num-workers 32 \
	--match 'string' 
	
--------------------------------------------------
SQuAD-v1.1-dev.txt
Examples:			10570
Matches in top 5:		8249
Match % in top 5:		78.04
Total time:			179.3955 (s)

python scripts/retriever/eval.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-dev.txt \
	--model /home/yechen/Workspace/DrQA/data//wikipedia/docs-tfidf-ngram=2-hash=16777216-tokenizer=corenlp.npz \
	--doc-db /home/yechen/Workspace/DrQA/data//wikipedia/docs.db \
	--tokenizer 'corenlp' \
	--n-docs 5 \
	--num-workers 32 \
	--match 'string'
	
	

python scripts/retriever/eval.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-dev-zh.txt \
	--model /home/yechen/Workspace/DrQA/data//wikipedia/docs-zh-tfidf-ngram=2-hash=16777216-tokenizer=spacyzh.npz \
	--doc-db /home/yechen/Workspace/DrQA/data//wikipedia/docs-zh.db \
	--tokenizer 'spacyzh' \
	--n-docs 5 \
	--num-workers 32 \
	--match 'string' 
	
--------------------------------------------------
SQuAD-v1.1-dev-zh.txt
Examples:			3726
Matches in top 5:		1553
Match % in top 5:		41.68
Total time:			885.2451 (s)

--------------------------------------------------
SQuAD-v1.1-dev-zh.txt
Examples:			3726
Matches in top 5:		1552
Match % in top 5:		41.65
Total time:			909.3811 (s)

--------------------------------------------------
SQuAD-v1.1-dev-zh.txt
Examples:			3726
Matches in top 5:		1560
Match % in top 5:		41.87
Total time:			953.0387 (s)

--------------------------------------------------
SQuAD-v1.1-dev-zh.txt
Examples:			3726
Matches in top 5:		1560
Match % in top 5:		41.87
Total time:			914.3088 (s)

python scripts/retriever/eval.py /home/yechen/Workspace/DrQA/data/datasets/SQuAD-v1.1-train-zh.txt \
	--model /home/yechen/Workspace/DrQA/data//wikipedia/docs-zh-tfidf-ngram=2-hash=16777216-tokenizer=spacyzh.npz \
	--doc-db /home/yechen/Workspace/DrQA/data//wikipedia/docs-zh.db \
	--tokenizer 'spacyzh' \
	--n-docs 5 \
	--num-workers 32 \
	--match 'string' 

--------------------------------------------------
SQuAD-v1.1-train-zh.txt
Examples:			44846
Matches in top 5:		16022
Match % in top 5:		35.73
Total time:			10232.2341 (s)

--------------------------------------------------
SQuAD-v1.1-train-zh.txt
Examples:			44846
Matches in top 5:		16088
Match % in top 5:		35.87
Total time:			10477.1859 (s)


python scripts/reader/preprocess.py data/datasets data/datasets --split SQuAD-v2.0-train-zh --tokenizer 'spacyzh' --workers 32
python scripts/reader/preprocess.py data/datasets data/datasets --split SQuAD-v2.0-dev-zh --tokenizer 'spacyzh' --workers 32

#python scripts/reader/preprocess.py data/datasets data/datasets --split SQuAD-v2.0-dev-zh --tokenizer 'jieba' --workers 32

  
