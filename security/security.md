# Trivy

## Installation
```bash
brew install aquasecurity/trivy/trivy
```
## Image
Container Images
Simply specify an image name (and a tag).

```bash
$ trivy image [YOUR_IMAGE_NAME]
```

### For example:
```bash
$ trivy image python:3.4-alpine
```

## Kubernetes
- This feature might change without preserving backwards compatibility.
- Scan your Kubernetes cluster for both Vulnerabilities and Misconfigurations.
- Trivy uses your local kubectl configuration to access the API server to list artifacts.
- Scan a full cluster and generate a simple summary report:

```bash
$ trivy k8s --report=summary
```
The summary report is the default. To get all of the detail the output contains, use --report all.

### Filter by severity:

```bash
$ trivy k8s --severity=CRITICAL --report=all
```

### Scan a specific namespace:

```bash
$ trivy k8s -n kube-system --report=summary
```

### Scan a specific resource and get all the output

```bash
$ trivy k8s deployment/appname
```

### The supported formats are table, which is the default, and json. To get a JSON output on a full cluster scan:

```bash
$ trivy k8s --format json -o results.json
```

## References
https://trivy.dev/v0.28.1/getting-started/installation/