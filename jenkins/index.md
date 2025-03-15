# Jenkins on Kubernetes: Setup Guide

## Introduction
Jenkins is a popular open-source automation server used for continuous integration and continuous deployment (CI/CD). Running Jenkins on Kubernetes provides scalability, fault tolerance, and flexibility in managing build pipelines.

## Prerequisites
Before deploying Jenkins on Kubernetes, ensure you have:
- A running Kubernetes cluster.
- `kubectl` CLI installed and configured.
- Helm package manager installed.

## Deploying Jenkins on Kubernetes

### Step 1: Add Jenkins Helm Repository
```sh
helm repo add jenkins https://charts.jenkins.io
helm repo update
```

### Step 2: Install Jenkins Using Helm
```sh
helm install jenkins jenkins/jenkins --namespace jenkins --create-namespace
```

### Step 3: Access Jenkins
Retrieve the admin password:
```sh
kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode
```

Port-forward the Jenkins service:
```sh
kubectl port-forward svc/jenkins 8080:8080 --namespace jenkins
```
Now, access Jenkins at `http://localhost:8080`

## Configuring Persistent Storage
To persist Jenkins data, use a Persistent Volume (PV):
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jenkins-pvc
  namespace: jenkins
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
```
Apply the PVC:
```sh
kubectl apply -f jenkins-pvc.yaml
```

## Setting Up a Jenkins Agent
To dynamically provision Jenkins agents in Kubernetes, use the Kubernetes plugin:
1. Navigate to **Manage Jenkins** → **Manage Plugins**.
2. Install the **Kubernetes** plugin.
3. Configure a new cloud in **Manage Jenkins** → **Manage Nodes and Clouds** → **Configure Clouds**.

## Creating a Sample CI/CD Pipeline
1. Create a new pipeline job in Jenkins.
2. Use the following `Jenkinsfile`:
```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building application...'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }
}
```

## Conclusion
Deploying Jenkins on Kubernetes enables scalable CI/CD automation. By leveraging Helm, persistent storage, and dynamic agents, you can build a robust and efficient automation pipeline.

