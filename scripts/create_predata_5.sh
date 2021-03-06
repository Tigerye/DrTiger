#!/bin/bash

# ./scripts/create_predata.sh 2020
#year=2020

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert

for infile in /data/yechen/bert/wiki.zh.article.pre.txt /data/yechen/bert/news.zh.2017.pre.txt;
do

echo "create predata from ${infile} ..."

python /home/yechen/Workspace/DrTiger/create_pretraining_data_v2.py \
  --input_file=${infile} \
  --output_file=$DATA_DIR/tf_examples_news${year}${outpart}.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True

done

echo "done create predata."