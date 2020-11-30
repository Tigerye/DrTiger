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
  --do_train=True \
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

python doc_tokenize_zh.py /data/yechen/bert/wiki.zh.section.txt /data/yechen/bert/wiki.zh.section.tokens.txt

python build_index_zh.py /data/yechen/bert/wiki.zh.section.tokens.txt /data/yechen/bert/drtiger/bm25_zh_section

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.section.txt /data/yechen/bert/drtiger/bm25_zh_section

#zh paragraph
python extract_paragraph_zh.py

python doc_tokenize_zh.py /data/yechen/bert/wiki.zh.paragraph.txt /data/yechen/bert/wiki.zh.paragraph.tokens.txt

python build_index_zh.py /data/yechen/bert/wiki.zh.paragraph.tokens.txt /data/yechen/bert/drtiger/bm25_zh_paragraph

python doc_retriever_zh.py /data/yechen/bert/wiki.zh.paragraph.txt /data/yechen/bert/drtiger/bm25_zh_paragraph


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

  
  
