#!/usr/bin/env bash

set -e

wget http://llwang.net/data/ontoemma/nci.json.gz -O data/nci.json.gz
wget http://llwang.net/data/ontoemma/ontoemma.context.dev.gz -O data/ontoemma.context.dev.gz
wget http://llwang.net/data/ontoemma/ontoemma.context.test.gz -O data/ontoemma.context.test.gz
wget http://llwang.net/data/ontoemma/ontoemma.context.train.gz -O data/ontoemma.context.train.gz
wget http://llwang.net/data/ontoemma/snomed.json.gz -O data/snomed.json.gz
wget http://llwang.net/data/ontoemma/weights100.txt.gz -O data/weights100.txt.gz

cd data/
gzip -d nci.json.gz
gzip -d ontoemma.context.dev.gz
gzip -d ontoemma.context.test.gz
gzip -d ontoemma.context.train.gz
gzip -d snomed.json.gz