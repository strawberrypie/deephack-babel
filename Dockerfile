FROM opennmt/opennmt:2063

RUN git clone https://github.com/OpenNMT/OpenNMT ~/OpenNMT

RUN sudo apt-get install wget

WORKDIR ~/OpenNMT

RUN wget https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7

RUN mkdir /data
RUN mkdir /output

RUN wget https://gist.githubusercontent.com/strawberrypie/dc42ea124988ab306d09bb450892b493/raw/d90713e4dd900626e5c474193902eddf8963a5c5/translate-opennmt.sh
RUN chmod +x translate-opennmt.sh

CMD ["./translate-opennmt.sh"]
