FROM reinoldus/ontoemma-training-data AS dataprovider

FROM conda/miniconda3

RUN apt-get update && apt-get install -y gzip wget git build-essential

COPY ./ /ontoemma

COPY --from=dataprovider /data/* /ontoemma/data/

WORKDIR /ontoemma

RUN ./setup-docker.sh

ENV CONDAENV=ontoemma

# RUN python -c "import nltk;nltk.download('wordnet');nltk.download('stopwords')"