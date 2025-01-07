# Loogging

### Using Helm Chart

##### Add the Helm Repository

```

helm repo add grafana https://grafana.github.io/helm-charts


```

##### Add the Helm Repository

```

helm install loki grafana/loki-stack -n monitoring

```
### Add the datasource to the grafana dashboard


### Go to the explore section and select loki as a datasource from drop-down list


### Use the log query to fetch the logs
