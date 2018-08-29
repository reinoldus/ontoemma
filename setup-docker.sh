#!/bin/bash

CONDAENV=ontoemma

conda update -n base conda

conda remove -y --name ${CONDAENV} --all

conda create -n ${CONDAENV} -y python==3.6 pip pytest || true

echo "Activating Conda Environment ----->"

source activate ${CONDAENV}

pip install -r requirements.txt

if [[ $(uname) == "Darwin" ]]; then
  conda install -y pytorch torchvision -c soumith
else
  conda install -y pytorch torchvision cuda80 -c soumith
fi

python -m spacy download en

python setup.py develop

