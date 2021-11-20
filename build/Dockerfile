FROM amd64/alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add wget
RUN wget https://github.com/Njoiyt/Metrics_Exporter/blob/master/alpine_exporter?raw=true
RUN mv alpine_exporter?raw=true alpine_exporter
RUN chmod +x alpine_exporter
ENTRYPOINT [ "sh", "-c", "exec ./alpine_exporter \
  --server.address=https://beaconcha.in/api/v1/client/metrics?apikey=$API_KEY \
  --beaconnode.type=prysm \
  --beaconnode.address=http://beacon-chain.prysm.dappnode:8080/metrics \
  --validator.type=prysm \
  --validator.address=http://prysm.dappnode:8081/metrics \
"]
