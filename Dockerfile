FROM alpine:3.12
RUN apk --no-cache update
RUN apk --no-cache upgrade
RUN apk --no-cache add bash
RUN apk --no-cache add ca-certificates
RUN update-ca-certificates
RUN opkg-install curl
RUN opkg-install wget
RUN curl -L https://raw.githubusercontent.com/gobitfly/eth2-client-metrics-exporter/master/.script/install.sh | bash
ENTRYPOINT [ "sh", "-c", "exec ./eth2-client-metrics-exporter-linux-amd64 \
  --server.address=https://beaconcha.in/api/v1/client/metrics?apikey=$API_KEY \
  --beaconnode.type=prysm \
  --beaconnode.address=http://beacon-chain.prysm.dappnode:8080/metrics \
  --validator.type=prysm \
  --validator.address=http://prysm.dappnode:8081/metrics \
"]
