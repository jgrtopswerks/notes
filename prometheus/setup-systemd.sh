cd prometheus-3.5.0.linux-amd64

useradd --no-create-home --shell /bin/false prometheus

mkdir /etc/prometheus
mkdir /var/lib/prometheus

chown prometheus:prometheus /etc/prometheus
chown prometheus:prometheus /var/lib/prometheus

cp prometheus promtool /usr/local/bin/

chown prometheus:prometheus /usr/local/bin/prometheus
chown prometheus:prometheus /usr/local/bin/promtool

cp prometheus.yml /etc/prometheus/

chown prometheus:prometheus /etc/prometheus/prometheus.yml

vi /etc/systemd/system/prometheus.service

[Unit]
Description=Prometheus Server
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus \
  --web.listen-address=0.0.0.0:9090

[Install]
WantedBy=multi-user.target

systemctl daemon-reload
systemctl start prometheus
systemctl enable prometheus
systemctl status prometheus