#!/usr/bin/env bash

source ~/miniconda3/bin/activate

if [ "$1" = "cuda" ]; then
    python train_ontoemma.py -c config/ontoemma_nn_sample_experiments_cuda.json -m /mnt -p nn
else
    python train_ontoemma.py -c config/ontoemma_nn_sample_experiments.json -m /mnt -p nn
fi