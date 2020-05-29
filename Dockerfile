FROM ubuntu:18.04
MAINTAINER Jaswinder Singh (jaswinder.singh3@griffithuni.edu.au)
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -y build-essential wget

RUN mkdir -p /usr/share/man/man1 & apt-get install -y default-jre openjdk-11-jre-headless virtualenv
RUN apt-get install -y cpanminus && cpanm Graph

RUN wget -c 'https://www.dropbox.com/s/eyfti3ge27p0lip/SPOT-RNA.tar.gz' && tar -xvzf SPOT-RNA.tar.gz && rm SPOT-RNA.tar.gz

WORKDIR SPOT-RNA
RUN wget -c 'https://www.dropbox.com/s/dsrcf460nbjqpxa/SPOT-RNA-models.tar.gz' || wget -O SPOT-RNA-models.tar.gz 'https://app.nihaocloud.com/f/fbf3315a91d542c0bdc2/?dl=1' && tar -xvzf SPOT-RNA-models.tar.gz && rm SPOT-RNA-models.tar.gz

RUN virtualenv -p python3.6 venv3_spotrna && source ./venv3_spotrna/bin/activate &&  pip install tensorflow==1.14.0 && pip install -r requirements.txt && deactivate
RUN chmod -R 777 SPOT-RNA.py SPOT-RNA && cp ./SPOT-RNA /usr/bin/ 
WORKDIR /

