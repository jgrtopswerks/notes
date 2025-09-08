http://<pushgateway_address>:<port>/metrics/job/<job_name>/<label1>/<value1>/<label2>/<value2>

echo "example_metric 4421" | curl --data-binary @- http://localhost:9091/metrics/job/db_backup

curl localhost:9091/metrics

cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/archive/db/mysql
# TYPE metric_one counter
metric_one{label="val1"} 11
# TYPE metric_two gauge
# HELP metric_two Just an example.
metric_two 100
EOF

$ cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/archive/app/web
# TYPE metric_one counter
metric_one{label="val1"} 22
# TYPE metric_two gauge
# HELP metric_two Just an example.
metric_two 200
EOF

$ curl localhost:9091/metrics | grep archive

$ cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/archive/app/web
# TYPE metric_one counter
metric_one{label="val1"} 44
EOF

$ cat <<EOF | curl -X PUT --data-binary @- http://localhost:9091/metrics/job/archive/app/web
# TYPE metric_one counter
metric_one{label="val1"} 44
EOF

$ curl -X DELETE http://localhost:9091/metrics/job/archive/app/web

