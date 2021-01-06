import json

config_data = {
  "attention_probs_dropout_prob": 0.1,
  "directionality": "bidi",
  "hidden_act": "gelu",
  "hidden_dropout_prob": 0.1,
  "hidden_size": 1024,
  "initializer_range": 0.02,
  "intermediate_size": 3072,
  "max_position_embeddings": 512,
  "num_attention_heads": 16,
  "num_hidden_layers": 16,
  "pooler_fc_size": 768,
  "pooler_num_attention_heads": 12,
  "pooler_num_fc_layers": 3,
  "pooler_size_per_head": 128,
  "pooler_type": "first_token_transform",
  "type_vocab_size": 2,
  "vocab_size": 21128
}
json.dump(config_data, open('/data/yechen/bert/chinese_L-24_H-1024_A-16/bert_config.json', 'w'), ensure_ascii=False)
print(f"Finished dump dr. tiger retrieved data for reader with [{num_doc}] docs\n")