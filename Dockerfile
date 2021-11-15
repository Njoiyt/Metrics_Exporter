FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add git
RUN apk add make
RUN apk add go
RUN git clone https://github.com/gobitfly/eth2-client-metrics-exporter.git
RUN make --directory=eth2-client-metrics-exporter
ENTRYPOINT [ "sh", "-c", "exec ./eth2-client-metrics-exporter/bin/eth2-client-metrics-exporter-linux-amd64 \
  --server.address=https://beaconcha.in/api/v1/client/metrics?apikey=$API_KEY \
  --beaconnode.type=prysm \
  --beaconnode.address=http://beacon-chain.prysm.dappnode:8080/metrics \
  --validator.type=prysm \
  --validator.address=http://prysm.dappnode:8081/metrics \
"]
