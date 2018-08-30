FROM reinoldus/ontoemma-training-data AS dataprovider

FROM nvcr.io/nvidia/cuda:9.2-base-ubuntu16.04

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

COPY --from=dataprovider /data/* /ontoemma/data/

COPY ./ /ontoemma

WORKDIR /ontoemma

RUN ./setup-docker2.sh
RUN mkdir /storage


# RUN python -c "import nltk;nltk.download('wordnet');nltk.download('stopwords')"