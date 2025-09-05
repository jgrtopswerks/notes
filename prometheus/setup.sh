wget https://github.com/prometheus/prometheus/releases/download/v3.5.0/prometheus-3.5.0.linux-amd64.tar.gz

tar -xvf prometheus-3.5.0.linux-amd64.tar.gz

cd prometheus-3.5.0.linux-amd64

./prometheus > /dev/null 2>&1 &