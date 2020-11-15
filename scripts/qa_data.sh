python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/qangaroo_v1.1/wikihop" \
	--from_files="source:train.json" \
	--from_format="qangaroo" \
	--to_format="squad" \
	--to_file_name="train.json" 
	
python executor.py \
	--log_path="/data/yechen/squad/log-qa-data.txt" \
	--data_path="/data/yechen/squad/mctest" \
	--from_files="source:mc160.train.tsv,answer:mc160.train.ans" \
	--from_format="mctest" \
	--to_format="squad" \
	--to_file_name="mc160.train.json" 