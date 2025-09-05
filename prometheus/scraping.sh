vi /etc/prometheus/prometheus.yml

Add below code under scrape_configs::

  - job_name: "nodes"
    static_configs:
      - targets: ["node01:9100"]
        labels:
          node: "node01"
      - targets: ["node02:9100"]
        labels:
          node: "node02"

          