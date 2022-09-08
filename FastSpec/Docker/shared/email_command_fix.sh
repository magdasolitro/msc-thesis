#!/bin/bash

python run_classifier.py --task_name=assembly --do_predict=true --data_dir=./example --vocab_file=./example/combined_reduced_vocab_format.v5.txt --bert_config_file=./bert_small_config.json --max_seq_length=250 --output_dir=./assembly_output
