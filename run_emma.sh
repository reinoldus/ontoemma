#!/usr/bin/env bash

source ~/miniconda3/bin/activate base

if [ "$1" = "cuda" ]; then
    python train_ontoemma.py -c config/ontoemma_nn_sample_experiments_cuda.json -m /storage -p nn
else
    python train_ontoemma.py -c config/ontoemma_nn_sample_experiments.json -m /storage -p nn
fi