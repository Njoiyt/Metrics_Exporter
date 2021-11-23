FROM amd64/alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add wget
RUN apk --no-cache add curl
RUN curl -s https://api.github.com/repos/Njoiyt/Metrics_Exporter/releases/latest | grep 'alpine_exporter' | cut -d : -f 2,3 |  tr -d \" | wget -qi -
RUN chmod +x alpine_exporter
ENTRYPOINT [ "sh", "-c", "exec ./alpine_exporter \
  --server.address=https://beaconcha.in/api/v1/client/metrics?apikey=$API_KEY&machine=$MACHINE_NAME \
  --beaconnode.type=prysm \
  --beaconnode.address=http://beacon-chain.prysm.dappnode:8080/metrics \
  --validator.type=prysm \
  --validator.address=http://prysm.dappnode:8081/metrics \
"]
