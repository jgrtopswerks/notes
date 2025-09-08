curl <prometheus_server>:9090/api/v1/query --data 'query=node_arp_entries{instance="192.168.1.168:9100"}'

curl <prometheus_server>:9090/api/v1/query --data 'query=node_arp_entries{instance="192.168.1.168:9100"}' --data 'time=1670380680.132'

curl <prometheus_server>:9090/api/v1/query --data 'query=node_memory_Active_bytes{job="node"}[10m]' --data 'time=1670380680.132' | jq

curl <prometheus_server>:9090/api/v1/query --data 'query=node_cpu_seconds_total{job="node"}'

curl <prometheus_server>:9090/api/v1/query --data 'query=node_cpu_seconds_total{job="node"}' | jq

curl localhost:9090/api/v1/query --data 'query=node_memory_Active_bytes{job="node"}' --data 'time=1670380680.132' | jq

curl localhost:9090/api/v1/query --data 'query=node_memory_Active_bytes{job="node"}[10m]' --data 'time=1670380680.132' | jq


