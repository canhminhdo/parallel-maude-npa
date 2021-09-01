FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    vim \
    wget \
    git \
    curl \
    zip \
    unzip \
    g++

RUN wget https://github.com/SRI-CSL/Maude/releases/download/Alpha136/Maude-alpha136-linux.zip \
    && unzip Maude-alpha136-linux.zip && mv Linux64 Maude && mv Maude/maude.linux64 Maude/maude \
    && rm Maude-alpha136-linux.zip

RUN wget http://maude.cs.illinois.edu/w/images/0/0a/Full-Maude-3.1.zip \
    && unzip Full-Maude-3.1.zip && mv full-maude31.maude Maude/full-maude.maude

ENV PATH=/Maude:$PATH

