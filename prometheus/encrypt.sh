sudo openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
  -keyout node_exporter.key -out node_exporter.crt \
  -subj "/C=US/ST=California/L=Oakland/O=MyOrg/CN=localhost" \
  -addext "subjectAltName = DNS:localhost"


vi config.yml

tls_server_config:
  cert_file: node_exporter.crt
  key_file: node_exporter.key

./node_exporter --web.config=config.yml




sudo mkdir /etc/node_exporter
mv node_exporter.* /etc/node_exporter
sudo cp config.yml /etc/node_exporter
sudo chown -R node_exporter:node_exporter /etc/node_exporter

vi /etc/systemd/system/node_exporter.service

[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target


[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --web.config=/etc/node_exporter/config.yml


[Install]
WantedBy=multi-user.target

systemctl daemon-reload
systemctl restart node_exporter


curl -k https://localhost:9100/metrics - for testing

scp username:password@node:/etc/node_exporter/node_exporter.crt /etc/prometheus
sudo chown prometheus:prometheus /etc/prometheus/node_exporter.crt

vi /etc/prometheus/prometheus.yml

scrape_configs:
  - job_name: "node"
    scheme: https
    tls_config:
      ca_file: /etc/prometheus/node_exporter.crt
      insecure_skip_verify: true
    static_configs:
      - targets: ["192.168.1.168:9100"]

sudo systemctl restart prometheus

$ sudo apt install apache2-utils
$ htpasswd -nBC 12 "" | tr -d ':\n'
New password:
Re-type new password:
$2y$12$gfAopKV008KKO63rJe0Z9efGRx30qJEZ9vcC8IxBP9.cXkurguc6


vi /etc/node_exporter/config.yml

tls_server_config:
  cert_file: node_exporter.crt
  key_file: node_exporter.key
basic_auth_users:
  prometheus: $2y$12$dCqkk9uah20wF

sudo systemctl restart node_exporter
