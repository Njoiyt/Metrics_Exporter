FROM ubuntu
RUN apt-get update
RUN apt-get upgrade
RUN apt install curl -y
RUN apt-get install wget -y
RUN curl -L https://raw.githubusercontent.com/gobitfly/eth2-client-metrics-exporter/master/.script/install.sh | bash
ENTRYPOINT [ "sh", "-c", "exec ./eth2-client-metrics-exporter-linux-amd64 \
  --server.address=https://beaconcha.in/api/v1/client/metrics?apikey=$API_KEY \
  --beaconnode.type=prysm \
  --beaconnode.address=http://beacon-chain.prysm.dappnode:8080/metrics \
  --validator.type=prysm \
  --debug = true \ 	
  --validator.address=http://prysm.dappnode:8081/metrics \
"]
