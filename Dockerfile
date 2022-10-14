FROM golang:1.18

ENV REPO=https://github.com/mdehoog/go-ethereum.git
ENV COMMIT=889e8568df528cb786ce85ec9396f15563efca63

RUN mkdir -p /app
WORKDIR /app

RUN git init
RUN git remote add origin $REPO
RUN git fetch --depth=1 origin $COMMIT
RUN git reset --hard FETCH_HEAD

RUN go build -o bin/geth ./cmd/geth


FROM golang:1.18

RUN mkdir -p /app
WORKDIR /app

ENV REPO=https://github.com/Inphi/prysm.git
ENV COMMIT=431ed6bc39e3d471474505bbec7b7486ffe4e183

RUN git init
RUN git remote add origin $REPO
RUN git fetch --depth=1 origin $COMMIT
RUN git reset --hard FETCH_HEAD

RUN go build -o bin/beacon-chain ./cmd/beacon-chain


FROM golang:1.18

RUN apt-get update && apt-get install -y curl

RUN mkdir -p /app
WORKDIR /app

COPY --from=0 /app/bin/geth geth
COPY --from=1 /app/bin/beacon-chain beacon-chain
COPY . .
