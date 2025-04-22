## Networking

### Install Nginx Ingress Controller

```
helm install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace --set controller.metrics.enabled=true --set-string controller.podAnnotations."prometheus\.io/scrape"="true" --set-string controller.podAnnotations."prometheus\.io/port"="10254"

```

## Enabling Proxy Protocol with NGINX Ingress Controller on AWS EKS

### Step 1: Configure the NGINX Load Balancer Service

    The first step involves annotating the NGINX Load Balancer Service to enable the Proxy Protocol.

    Locate your NGINX Load Balancer Service YAML file (service.yaml), and add the following annotation under the metadata section:

    metadata:
    annotations:
        service.beta.kubernetes.io/aws-load-balancer-proxy-protocol: '*'

### Step 2: Update the NGINX Ingress Controller ConfigMap

    Next, you’ll need to ensure that the NGINX Ingress Controller is configured to use the Proxy Protocol. This involves modifying the ConfigMap associated with your Ingress Controller to parse the Proxy Protocol header.

    Create or update the ConfigMap for the NGINX Ingress Controller as follows:

    apiVersion: v1
    kind: ConfigMap
    metadata:
    name: nginx-controller-nginx-ingress-controller
    namespace: ingress-nginx
    data:
    use-proxy-protocol: "true"

### Step 3: Restart NGINX Ingress Controller Pods

    For the changes to take effect, you must restart the NGINX Ingress Controller pods. This can be safely done by deleting the current pods, causing the deployment to spawn new ones with the updated configuration:

    ```

    kubectl delete pods -l app.kubernetes.io/name=nginx-ingress-controller -n ingress-nginx

    ```

## References
- https://medium.com/@fyarbasi/enabling-proxy-protocol-with-nginx-ingress-controller-on-aws-eks-91b51800328f


