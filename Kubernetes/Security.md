# Container and Pod Security Guide  

## **1. Image Hardening**  

### **Minimal Base Images**  
Use distroless base image (Google)
```Dockerfile
    FROM gcr.io/distroless/base-debian11
    COPY app /app
    CMD ["/app"]
```

**Why**: Reduces attack surface by excluding unnecessary packages

### **Multi-Stage Builds**  
Build stage
```Dockerfile
    FROM golang:1.21 AS builder
    WORKDIR /app
    COPY . .
    RUN CGO_ENABLED=0 go build -o myapp

    Final stage
    FROM alpine:3.19
    COPY --from=builder /app/myapp /
    USER 1001:1001
    CMD ["/myapp"]
```

**Benefits**:  
- Removes build tools from production images
- Reduces image size by 60-80%

### **Non-Root Execution**  
```yaml
    apiVersion: v1
    kind: Pod
    metadata:
    name: secure-pod
    spec:
    securityContext:
    runAsNonRoot: true
    runAsUser: 1000
    containers:

    name: app
    image: nginx:1.25
    securityContext:
    allowPrivilegeEscalation: false
    capabilities:
    drop: ["ALL"]
```

**Critical Settings**:  
- `runAsNonRoot`: Blocks root execution  
- `drop: ["ALL"]`: Removes Linux capabilities


## **2. Runtime Security**  

### **Pod Security Standards (Kubernetes 1.30+)**  
| Control                | Baseline Profile         | Restricted Profile       |
|------------------------|--------------------------|--------------------------|
| Root Execution         | Allowed                  | **Blocked**              |  
| Privileged Escalation  | Allowed                  | **Blocked**              |  
| Host Namespaces        | **Blocked**              | **Blocked**              |  
| Volume Types           | Restricted               | **Only Safe Types**      |  

Enforce via namespace labels:  
```bash
    kubectl label ns production pod-security.kubernetes.io/enforce=restricted
```

### **Network Policy Enforcement**  
```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
    name: default-deny
    spec:
    podSelector: {}
    policyTypes:
    - Ingress
    - Egress
```



**Impact**:  
- Implements zero-trust networking
- Reduces lateral movement risks by 83%


## **3. Vulnerability Scanning**  

### **Tool Comparison**  
| Tool       | Scan Type       | CI/CD Integration | Critical CVEs Found* |  
|------------|-----------------|-------------------|----------------------|  
| Trivy      | Image/Config    | Jenkins, GitHub   | CVE-2024-1234 (9.8)  |  
| Clair      | Image           | Quay, Artifactory | CVE-2023-4567 (9.2)  |  
| OWASP ZAP  | Web App         | GitLab, CircleCI  | SQLi, XSS            |  

*Sample findings from financial sector deployments

### **Trivy Scan Workflow**  
Full image scan
```bash
    trivy image --severity CRITICAL myapp:latest
```

SBOM generation
```bash
    trivy image --format cyclonedx myapp:latest > sbom.xml
```bash

Kubernetes cluster scan
```bash
    trivy k8s --report summary cluster
```

## **4. Compliance & Auditing**  

### **CIS Docker Benchmark Controls**  
1. **2.1** Ensure container has no privileged capabilities  
2. **4.1** Ensure images are scanned for vulnerabilities  
3. **5.4** Ensure containers are running with read-only root FS  

**Enforcement via Open Policy Agent**:  
```rego
package main

deny[msg] {
input.kind == "Pod"
not input.spec.securityContext.runAsNonRoot
msg := "Pods must run as non-root users"
}
```

### **Red Hat Quay Security Operator**
```bash
    oc get vuln --all-namespaces
    oc describe vuln sha256.ac50e3752... -n production
```

**Output**:
```output
Critical: 12 (CVE-2024-5678 glibc)
High: 45 (CVE-2023-8910 openssl)
```


## **5. Case Study: Financial Services**  

**Challenge**:  
- 500+ containers with 78 critical vulnerabilities  
- Failed PCI DSS audit  

**Solution**:  
1. Implemented Trivy in CI pipeline  
2. Enforced restricted PSS via Gatekeeper  
3. Deployed Falco for runtime monitoring  

**Results**:  
- 92% reduction in critical CVEs  
- PCI DSS compliance achieved in 3 months  
- Blocked 15 cryptojacking attempts


## **6. Best Practices Checklist**  

1. Use distroless/alpine base images  
2. Enforce `runAsNonRoot` via admission controllers  
3. Scan images in registry (Quay/ECR) and CI/CD  
4. Apply network policies with Calico/Cilium  
5. Rotate secrets weekly using Vault  
6. Conduct monthly red team exercises  

Automated compliance check
```bash
    kube-bench run --targets node,master,controlplane
```
