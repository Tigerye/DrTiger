import json

outfile='/data/yechen/bert/chinese_L-24_H-1024_A-16/bert_config.json'

config_data = {
  "attention_probs_dropout_prob": 0.1,
  "directionality": "bidi",
  "hidden_act": "gelu",
  "hidden_dropout_prob": 0.1,
  "hidden_size": 1024,
  "initializer_range": 0.02,
  "intermediate_size": 4096,
  "max_position_embeddings": 512,
  "num_attention_heads": 16,
  "num_hidden_layers": 24,
  "type_vocab_size": 2,
  "vocab_size": 21128
}

json.dump(config_data, open(outfile, 'w'), ensure_ascii=False)
print("wrote bert config to:",outfile)