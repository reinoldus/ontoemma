#!/bin/bash

CONDAENV=ontoemma

wget -nc --continue https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b || true

export PATH=$HOME/miniconda/bin:$HOME/miniconda3/bin:$PATH

#conda create -n ${CONDAENV} -y python==3.6 pip pytest || true

echo "Activating Conda Environment ----->"

# source activate ${CONDAENV}

pip install -r requirements.txt

if [[ $(uname) == "Darwin" ]]; then
  conda install -y pytorch torchvision -c soumith
else
  conda install -y pytorch torchvision cuda80 -c soumith
fi

python -m spacy download en

python setup.py develop

