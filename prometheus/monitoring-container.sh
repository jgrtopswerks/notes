promtool check config /etc/prometheus/prometheus.yml
Checking prometheus.yml
FAILED: parsing YAML file prometheus.yml: yaml: unmarshal errors:
  line 24: field metric_path not found in type config.ScrapeConfig




vi /etc/docker/daemon.json

{
  "metrics-addr": "127.0.0.1:9323",
  "experimental": true
}

sudo systemctl restart docker
curl localhost:9323/metrics


#prometheus.yml
scrape_configs:
  - job_name: "docker"
    static_configs:
      - targets: ["12.1.13.4:9323"] #docker host IP
vi docker-compose.yml
version: '3.4'
services:
  cadvisor:
    image: gcr.io/cadvisor/cadvisor
    container_name: cadvisor
    privileged: true
    devices:
      - "/dev/kmsg:/dev/kmsg"
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker:/var/lib/docker:ro
      - /dev/disk:/dev/disk:ro
    ports:
      - 8000:8000

docker-compose up 

curl localhost:8000/metrics