FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y \
    curl \
    gcc \
    make \
    unar \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /ZINC-Exp
WORKDIR /ZINC-Exp

# Download and extract the ZINC
RUN curl http://web.tuat.ac.jp/~k1kaneko/gengo/gengo2002.tar.gz --output ZINC.tar.gz
RUN unar ./ZINC.tar.gz

# Setup ZINC
WORKDIR /ZINC-Exp/gengo2002/zinc-0
RUN make clean
RUN make znc

WORKDIR /ZINC-Exp/gengo2002/p386
RUN make clean
RUN make p386

WORKDIR /ZINC-Exp/gengo2002
RUN mv ./zinc-0/test ./

COPY ./jikkou ./zinc-0/
RUN chmod +x ./zinc-0/jikkou
COPY ./zinc-rebuild ./zinc-0/
RUN chmod +x ./zinc-0/zinc-rebuild

WORKDIR /home

ENV PATH="/ZINC-Exp/gengo2002/zinc-0:/ZINC-Exp/gengo2002/p386:/ZINC-Exp/gengo2002/znas:${PATH}"

CMD ["/bin/bash"]
