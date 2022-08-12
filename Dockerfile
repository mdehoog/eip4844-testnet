FROM golang:1.18

ENV REPO=https://github.com/mdehoog/go-ethereum.git
ENV BRANCH=eip-4844
ENV COMMIT=769f14885dfc0417b55ed531c5ec4d936dcbde99

RUN mkdir -p /app
WORKDIR /app

RUN git clone --depth 1 -b $BRANCH $REPO .
RUN bash -c "[ $(git rev-parse HEAD) == $COMMIT ]"
RUN go build -o bin/geth ./cmd/geth


FROM golang:1.18

RUN mkdir -p /app
WORKDIR /app

ENV REPO=https://github.com/Inphi/prysm.git
ENV BRANCH=inphi/clean-slate
ENV COMMIT=b34d8afa1c892af894b60e1753a968a2c82e1a89

RUN git clone --depth 1 -b $BRANCH $REPO .
RUN bash -c "[ $(git rev-parse HEAD) == $COMMIT ]"
RUN go build -o bin/beacon-chain ./cmd/beacon-chain


FROM golang:1.18

RUN mkdir -p /app
WORKDIR /app

COPY --from=0 /app/bin/geth geth
COPY --from=1 /app/bin/beacon-chain beacon-chain
COPY . .