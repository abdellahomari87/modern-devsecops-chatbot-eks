# 🚀 Modern DevSecOps Chatbot Platform on AWS EKS

## 📌 Project Overview

This project demonstrates a production-grade **Cloud Native DevSecOps platform** for deploying an AI-powered chatbot application on Amazon EKS using modern security best practices.

The platform implements a secure software supply chain from code commit to Kubernetes deployment.

---

## 🏗 Architecture

```text
Developer
    ↓
GitHub Push
    ↓
GitHub Actions CI/CD
    ↓
Static Security Scanning
    ↓
Docker Build
    ↓
SBOM Generation
    ↓
Cosign Image Signing
    ↓
Amazon ECR
    ↓
Kyverno VerifyImages
    ↓
Amazon EKS
    ↓
AWS Application Load Balancer
    ↓
End Users
```

---

## ☁ Cloud Services

* Amazon EKS
* Amazon ECR
* AWS Application Load Balancer
* IAM Roles for Service Accounts (IRSA)
* GitHub OIDC Federation

---

## 🛠 Infrastructure as Code

* Terraform

Infrastructure deployed using Terraform:

* VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Route Tables
* EKS Cluster
* Managed Node Groups
* ECR Repository
* IAM Roles
* OIDC Provider

---

## 🔄 CI/CD Pipeline

CI/CD is fully implemented using GitHub Actions.

### Pipeline Steps

```text
Git Push
   ↓
Checkout Code
   ↓
NPM Install
   ↓
Unit Tests
   ↓
Trivy Filesystem Scan
   ↓
Docker Build
   ↓
Trivy Image Scan
   ↓
SBOM Generation
   ↓
Push Image to ECR
   ↓
Cosign Image Signing
   ↓
Deploy Kyverno Policies
   ↓
Deploy Application to EKS
```

---

## 🐳 Containerization

* Docker Multi-stage Build
* Immutable image tags
* ECR vulnerability scanning enabled

---

## ☸ Kubernetes Components

* Namespace
* Deployment
* Service
* Ingress
* Horizontal Pod Autoscaler (HPA)
* NetworkPolicy
* PodDisruptionBudget

---

## 🔐 Kubernetes Security

### Pod Security Standards

Restricted mode enabled:

```text
pod-security.kubernetes.io/enforce=restricted
```

### Security Context

Implemented:

* runAsNonRoot
* seccompProfile RuntimeDefault
* allowPrivilegeEscalation=false
* capabilities.drop=ALL

### Resource Management

* CPU Requests
* Memory Requests
* CPU Limits
* Memory Limits

### Health Checks

* Readiness Probe
* Liveness Probe

---

## 🛡 DevSecOps Security Controls

### Trivy

Implemented:

* Filesystem Scan
* Container Image Scan

### Kyverno Policies

Implemented policies:

* Require Non-Root Containers
* Require Resource Limits
* Disallow Latest Tags
* Verify Signed Images

### Network Policies

Ingress and Egress traffic restrictions implemented.

### HPA

Automatic scaling based on CPU utilization.

---

## 🔏 Supply Chain Security

### SBOM

Software Bill of Materials generated automatically.

### Cosign

Container images are signed automatically using Sigstore Cosign.

### GitHub OIDC

Authentication without long-lived AWS credentials.

### Image Verification

Kyverno verifies image signatures before deployment.

Only signed images are allowed to run on the cluster.

---

## ✅ Security Validation

### Test 1: Unsigned Image

```bash
kubectl apply -f unsigned-ecr-pod.yaml
```

Expected result:

```text
Error from server (Forbidden)
```

### Test 2: Malicious Pod

```bash
kubectl run bad-pod --image=nginx:latest -n chatbot
```

Result:

```text
Blocked by Pod Security Standards and Kyverno
```

---

## 📊 Current Features

✅ Terraform Infrastructure as Code

✅ Amazon EKS

✅ Amazon ECR

✅ GitHub Actions CI/CD

✅ Docker

✅ Trivy Scanning

✅ SBOM Generation

✅ Cosign Signing

✅ GitHub OIDC

✅ Kyverno Admission Control

✅ VerifyImages Policy

✅ Network Policies

✅ HPA

✅ Pod Security Standards

✅ AWS Load Balancer Controller

✅ Application Load Balancer

---

## 🚀 Future Improvements

* Prometheus
* Grafana
* Alertmanager
* Falco Runtime Security
* Trivy Operator
* External Secrets Operator
* AWS Secrets Manager
* ArgoCD GitOps

---

## 👨‍💻 Author

Abdellah Omari

Cloud DevSecOps Engineer | AWS | Kubernetes | Terraform | Security
