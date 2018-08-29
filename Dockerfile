FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gzip wget

COPY download-data.sh /

RUN mkdir -p /data && bash download-data.sh

COPY ./ /ontoemma

RUN mv /data/* /ontoemma/data/

WORKDIR /ontoemma

#RUN pip3 install -r requirements.txt
#RUN pip3 install http://download.pytorch.org/whl/cpu/torch-0.4.1-cp36-cp36m-linux_x86_64.whl
#RUN pip3 install torchvision
RUN ./setup.sh

RUN python -c "import nltk;nltk.download('wordnet');nltk.download('stopwords')"