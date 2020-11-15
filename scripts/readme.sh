#retriever
python extract_text.py /data/yechen/bert/zhwiki-20201101-pages-articles-multistream.xml.bz2 /data/yechen/bert/wiki.zh.txt

python doc_tokenize.py

python doc_retriever.py


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
  "exact": 60.39729268695317,
  "f1": 60.39729268695317,
  "total": 36346,
  "HasAns_exact": 60.39729268695317,
  "HasAns_f1": 60.39729268695317,
  "HasAns_total": 36346,
  "best_exact": 60.39729268695317,
  "best_exact_thresh": -0.00041866302490234375,
  "best_f1": 60.39729268695317,
  "best_f1_thresh": -0.00041866302490234375
}

THRESH=-0.00041866302490234375
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
  
  
