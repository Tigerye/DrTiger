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
  --predict_file=$SQUAD_DIR/squad-and-newsqa-dev-v2.0.json \
  --train_batch_size=1 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_large_1-256/ \
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
  
nohup python run_squad.py   --vocab_file=$BERT_LARGE_DIR/vocab.txt   --bert_config_file=$BERT_LARGE_DIR/bert_config.json   --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt   --do_train=False   --train_file=$SQUAD_DIR/data/combined-squad-train-v2.0.json   --do_predict=True   --predict_file=$SQUAD_DIR/data/combined-squad-dev-v2.0.json   --train_batch_size=1   --learning_rate=3e-5   --num_train_epochs=2.0   --max_seq_length=256   --doc_stride=128   --output_dir=$SQUAD_DIR/squad_2.0_large_8data/   --version_2_with_negative=True > log-squad.txt &
  

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
  --doc_stride=128 \
  --output_dir=$SQUAD_DIR/squad_2.0_base_6data/ \
  --version_2_with_negative=True


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

















  
  
