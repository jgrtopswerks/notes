| stats count — counts all events

| stats count by status — counts events grouped by status

| stats sum(bytes) as total_bytes — total of all bytes

| stats avg(bytes) as avg_bytes — average bytes value

| stats min(bytes) as min_bytes, max(bytes) as max_bytes — smallest and largest byte values

| stats dc(status) as distinct_status — distinct count of status codes

| stats values(status) as all_statuses — list of unique status values

| stats list(uri_path) as all_pages — list of all pages (with duplicates)

| stats perc25(bytes), perc50(bytes), perc95(bytes) — 25th, 50th (median), 95th percentiles of bytes

| stats first(uri) as first_page, last(uri) as last_page — first and last page seen in results

| stats mode(status) as common_status — most frequent status code

| stats stdev(bytes), var(bytes) — standard deviation and variance of bytes

| stats count(eval(status=200)) as success, count(eval(status=404)) as not_found — conditional counts for specific values

| stats count, avg(bytes), sum(bytes) by host — multiple stats grouped by host

| stats count by uri_path | sort -count | head 10 — top 10 most visited pages

| bin _time span=1h | stats count, avg(bytes) by _time — hourly event count and average bytes