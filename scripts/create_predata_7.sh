#!/bin/bash

# ./scripts/create_predata.sh 2018
year=2019

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert

for infile in `ls /data/yechen/bert/news.zh.${year}.txt.pre.part*.cln`;
do
outpart=`echo $infile | sed 's/.*pre\.//g' | sed 's/\.cln//g'`
echo "create predata from ${infile} to tf_examples_news${year}${outpart}_seq512.tfrecord ..."

python /home/yechen/Workspace/DrTiger/create_pretraining_data.py \
  --input_file=${infile} \
  --output_file=$DATA_DIR/seq512/tf_examples_news${year}${outpart}_seq512.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True

done

echo "done create predata for year ${year}."

year=2018

BERT_BASE_DIR=/data/yechen/bert/chinese_L-12_H-768_A-12
DATA_DIR=/data/yechen/bert

for infile in `ls /data/yechen/bert/news.zh.${year}.txt.pre.part*.cln`;
do
outpart=`echo $infile | sed 's/.*pre\.//g' | sed 's/\.cln//g'`
echo "create predata from ${infile} to tf_examples_news${year}${outpart}_seq512.tfrecord ..."

python /home/yechen/Workspace/DrTiger/create_pretraining_data.py \
  --input_file=${infile} \
  --output_file=$DATA_DIR/seq512/tf_examples_news${year}${outpart}_seq512.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=512 \
  --max_predictions_per_seq=80 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5 \
  --do_whole_word_mask=True

done

echo "done create predata for year ${year}."