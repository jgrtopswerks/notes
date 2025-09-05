global:
  scrape_configs:
    - job_name: "prometheus"
      static_configs:
        - targets: ["localhost:9090"]


vi prometheus.yml
docker run -d -v /path-to/prometheus.yml:/etc/prometheus/prometheus.yml -p 9090:9090 prom/prometheus
