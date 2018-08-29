FROM reinoldus/ontoemma-training-data AS dataprovider

FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gzip wget git build-essential

COPY ./setup-docker.sh /
COPY ./requirements.txt /

RUN ./setup-docker.sh

ENV CONDAENV=ontoemma


# Otherwise the progressbar stuff does not work...
RUN apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY ./ /ontoemma

WORKDIR /ontoemma

RUN ./setup-docker2.sh

COPY --from=dataprovider /data/* /ontoemma/data/


# RUN python -c "import nltk;nltk.download('wordnet');nltk.download('stopwords')"