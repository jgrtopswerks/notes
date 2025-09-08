Perfect 👍 Let’s answer all three parts (Prometheus Setup, Querying, and Alerts) with CentOS 9 commands step by step:

⸻
Part 1: Understanding the Prometheus Setup
1. Check if Prometheus is running

systemctl status prometheus

or

ps -ef | grep prometheus


⸻
2. Find the configuration file

ps -ef | grep prometheus | grep -- --config.file

(Default: /etc/prometheus/prometheus.yml)

⸻
3. Locate the data directory

ps -ef | grep prometheus | grep -- --storage.tsdb.path

(Default: /var/lib/prometheus)

⸻
4. Check the default scrape interval

grep scrape_interval /etc/prometheus/prometheus.yml

(Default: 15s)

⸻
5. Review the current scrape targets

Open browser:
http://<server-ip>:9090/targets


⸻
6. Check for unhealthy targets

Same Prometheus UI: Status → Targets

	•	Healthy = UP

	•	Unhealthy = DOWN

⸻
Part 2: Querying Prometheus

Open Prometheus UI → Graph tab, then run these PromQL queries:
7. Query CPU usage

1 - avg(rate(node_cpu_seconds_total{mode="idle"}[5m])) by (instance)

(Returns CPU usage % per instance)

⸻
8. Query memory usage

Used memory:

node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes

Memory usage %:

(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100


⸻
Part 3: Working with Alerts
9. Create alert rule file

sudo vi /etc/prometheus/rules.yml

Paste:

groups:

- name: example

  rules:

  - alert: LowCpuUsage

    expr: rate(process_cpu_seconds_total[30s]) * 100 < 20

    for: 1m

    annotations:

      summary: "Low usage on {{ $labels.instance }}"

      description: "{{ $labels.instance }} has low CPU usage (current value: {{ $value }}s). Please consider downsizing!"


⸻
10. Add alert rule to Prometheus config

Edit config:

sudo vi /etc/prometheus/prometheus.yml

Add:

rule_files:

  - "rules.yml"

Restart Prometheus:

sudo systemctl restart prometheus


⸻
11. Check alert status

Go to:
http://<server-ip>:9090/alerts

States: Inactive, Pending, Firing.

⸻
12. Understand the alert rule

	•	Fires if CPU usage < 20% for 1 minute.

	•	Annotation suggests downsizing.

⸻
13. Modify the alert threshold

Edit rules.yml:

expr: rate(process_cpu_seconds_total[30s]) * 100 < 10

Restart Prometheus:

sudo systemctl restart prometheus


⸻
14. Re-observe alert status

Return to:
http://<server-ip>:9090/alerts

Check status again.

⸻

✅ That’s the full Prometheus lab workflow on CentOS 9.

Do you want me to also include systemctl enable/start setup steps (so Prometheus auto-starts on boot) as part of this guide?
 