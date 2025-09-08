wget https://github.com/prometheus/pushgateway/releases/download/v1.4.3/pushgateway-1.4.3.linux-amd64.tar.gz
tar xvf pushgateway-1.4.3.linux-amd64.tar.gz
cd pushgateway-1.4.3.linux-amd64


sudo useradd --no-create-home --shell /bin/false pushgateway
sudo cp pushgateway /usr/local/bin/


sudo vi /etc/systemd/system/pushgateway.service

[Unit]
Description=Prometheus Pushgateway
Wants=network-online.target
After=network-online.target


[Service]
User=pushgateway
Group=pushgateway
Type=simple
ExecStart=/usr/local/bin/pushgateway


[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl restart pushgateway
sudo systemctl enable pushgateway
systemctl status pushgateway

curl localhost:9091/metrics


sudo vi prometheus.yml

scrape_configs:
  - job_name: pushgateway
    honor_labels: true
    static_configs:
      - targets: ["192.168.1.168:9091"]
