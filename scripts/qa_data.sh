#qangaroo
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/qangaroo_v1.1/wikihop" \
	--from_files="source:train.json" \
	--from_format="qangaroo" \
	--to_format="squad" \
	--to_file_name="wikihop_train.json" 
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/qangaroo_v1.1/wikihop" \
	--from_files="source:dev.json" \
	--from_format="qangaroo" \
	--to_format="squad" \
	--to_file_name="wikihop_dev.json" 
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/qangaroo_v1.1/medhop" \
	--from_files="source:train.json" \
	--from_format="qangaroo" \
	--to_format="squad" \
	--to_file_name="medhop_train.json" 
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/qangaroo_v1.1/medhop" \
	--from_files="source:dev.json" \
	--from_format="qangaroo" \
	--to_format="squad" \
	--to_file_name="medhop_dev.json" 


#mctest
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/mctest" \
	--from_files="source:mc160.train.tsv,answer:mc160.train.ans" \
	--from_format="mctest" \
	--to_format="squad" \
	--to_file_name="mc160.train.json" 
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/mctest" \
	--from_files="source:mc160.dev.tsv,answer:mc160.dev.ans" \
	--from_format="mctest" \
	--to_format="squad" \
	--to_file_name="mc160.dev.json"
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/mctest" \
	--from_files="source:mc500.train.tsv,answer:mc500.train.ans" \
	--from_format="mctest" \
	--to_format="squad" \
	--to_file_name="mc500.train.json" 
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/mctest" \
	--from_files="source:mc500.dev.tsv,answer:mc500.dev.ans" \
	--from_format="mctest" \
	--to_format="squad" \
	--to_file_name="mc500.dev.json"
	
#wikiqa
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/WikiQACorpus" \
	--from_files="source:WikiQA-train.tsv" \
	--from_format="wikiqa" \
	--to_format="squad" \
	--to_file_name="train.json" 
	
	
	
	
	
