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
  --version_2_with_negative=True
  
  
  
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

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_web_dev.json /data/yechen/squad/data/triviaqa_to_squad_web_dev_zh.json > log-triviaqa-web-dev.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_wikipedia_train.json /data/yechen/squad/data/triviaqa_to_squad_wikipedia_train_zh.json > log-triviaqa-wikipedia-train.txt &

nohup python squad_en_to_zh.py /data/yechen/squad/data/triviaqa_to_squad_wikipedia_dev.json /data/yechen/squad/data/triviaqa_to_squad_wikipedia_dev_zh.json > log-triviaqa-wikipedia-dev.txt &

















  
  
