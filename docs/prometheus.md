# Kubernetes Monitoring

## Metrics

### Add Helm Repository

```

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

```

### Install Prometheus

```

helm upgrade --install monitoring prometheus-community/prometheus --set persistence.enabled=true,persistence.size=8Gi --namespace monitoring

```

## Logging

### Add Helm Repository 

```
helm repo add grafana https://grafana.github.io/helm-charts

```

### Install Loki Stack

```
helm install loki grafana/loki-stack -n monitoring

```

## Observablity

### Install Grafana Dashbaord

```

helm install grafana grafana/grafana --namespace monitoring --set persistence.enabled=true,persistence.size=1Gi

```

## Alerting

### Add gChat Alert Repository

```
helm repo add julb https://charts.julb.me

```

### Install gChat Alert 

```

helm install alert-manager julb/alertmanager-gchat-integration --namespace monitoring

```
### Step 2:
Verify if all the pods are running.

``` kubectl get pods -n monitoring ```

#### Step 3:
Verify service available.

``` kubectl get svc -n monitoring ```

#### Step 4:
Update configmap of prometheus alert-manager with the webhook url of gchat.

```
apiVersion: v1
data:
  alertmanager.yml: |
	global: {}
	receivers:
    	webhook_configs:
        - url: 'http://<GCHAT_SERVICE-NAME>:<SERVICE_PORT>/alerts?room=<Google_Room_Name>' ```
```		


# References
https://prometheus.io/docs/alerting/latest/configuration/#webhook_config
https://stackoverflow.com/questions/66333868/send-notification-from-prometheus-alertmanager-to-google-chat-room/66337152#66337152
https://github.com/mr-karan/calert
