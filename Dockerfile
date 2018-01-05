FROM opennmt/opennmt:2063

RUN sudo apt-get update && sudo apt-get install wget

# Dependencies
RUN mkdir -p /path/to
WORKDIR /path/to/
# * MosesDecoder
RUN git clone https://github.com/moses-smt/mosesdecoder

# * OpenNMT
RUN git clone https://github.com/OpenNMT/OpenNMT /root/OpenNMT
WORKDIR /root/OpenNMT

# Downloading pretrained model
RUN wget https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7 \ 
    -O ~/OpenNMT/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7

RUN mkdir /data && mkdir /output

# Downloading inference script
RUN wget https://gist.githubusercontent.com/strawberrypie/dc42ea124988ab306d09bb450892b493/raw \ 
        -O ~/OpenNMT/translate-opennmt.sh && \ 
    chmod +x ~/OpenNMT/translate-opennmt.sh

CMD ["./translate-opennmt.sh"]
