# StatsD to Prometheus

Observability journey

## Quickstart

```
docker-compose -f docker/docker-compose.yml up
```

Grafana http://localhost:3000/

Prometheus UI http://localhost:9090/

StatsD Exporter Metrics http://localhost:9102/metrics

Graphite web UI http://localhost:8000/

## Observations

1. StatsD library in Ruby app keeps the state of the counters.
1. Prometheus misses some metrics, if cycle runtime (random up to 20 seconds) is less than scrape interval (15 seconds)

## To do

* Run every cycle in a thread or a process to simulate short lived jobs

