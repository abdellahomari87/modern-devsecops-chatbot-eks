# 🚀 Plateforme DevSecOps Moderne pour Chatbot IA sur AWS EKS

## 📌 Présentation du projet

Ce projet démontre la mise en œuvre d'une plateforme **Cloud Native DevSecOps** moderne permettant le déploiement sécurisé d'une application de chatbot IA sur Amazon EKS.

L'objectif est de sécuriser l'ensemble de la chaîne logicielle, depuis le commit Git jusqu'au déploiement Kubernetes.

---

## 🏗 Architecture

```text
Développeur
    ↓
Git Push
    ↓
GitHub Actions CI/CD
    ↓
Scans de sécurité
    ↓
Build Docker
    ↓
Génération SBOM
    ↓
Signature Cosign
    ↓
Amazon ECR
    ↓
Vérification Kyverno
    ↓
Amazon EKS
    ↓
AWS Application Load Balancer
    ↓
Utilisateurs
```

---

## ☁ Services AWS utilisés

* Amazon EKS
* Amazon ECR
* AWS Application Load Balancer
* IAM Roles for Service Accounts (IRSA)
* GitHub OIDC Federation

---

## 🛠 Infrastructure as Code

* Terraform

Infrastructure déployée :

* VPC
* Sous-réseaux publics et privés
* Internet Gateway
* NAT Gateway
* Tables de routage
* Cluster EKS
* Managed Node Groups
* Dépôt ECR
* IAM Roles
* OIDC Provider

---

## 🔄 Pipeline CI/CD

Pipeline entièrement automatisé avec GitHub Actions.

### Étapes du pipeline

```text
Git Push
   ↓
Checkout du code
   ↓
Installation des dépendances
   ↓
Tests
   ↓
Scan Trivy du code
   ↓
Build Docker
   ↓
Scan Trivy de l'image
   ↓
Génération SBOM
   ↓
Push vers Amazon ECR
   ↓
Signature Cosign
   ↓
Déploiement des policies Kyverno
   ↓
Déploiement sur EKS
```

---

## 🐳 Conteneurisation

* Docker Multi-stage Build
* Tags immuables
* Scan automatique des vulnérabilités ECR

---

## ☸ Composants Kubernetes

* Namespace
* Deployment
* Service
* Ingress
* Horizontal Pod Autoscaler (HPA)
* NetworkPolicy
* PodDisruptionBudget

---

## 🔐 Sécurité Kubernetes

### Pod Security Standards

Mode :

```text
restricted
```

### Security Context

Implémentation :

* runAsNonRoot
* seccompProfile RuntimeDefault
* allowPrivilegeEscalation=false
* capabilities.drop=ALL

### Gestion des ressources

* CPU Requests
* Memory Requests
* CPU Limits
* Memory Limits

### Vérification de santé

* Readiness Probe
* Liveness Probe

---

## 🛡 Contrôles DevSecOps

### Trivy

* Scan du filesystem
* Scan des images Docker

### Kyverno

Policies implémentées :

* Containers non-root obligatoires
* Resource Limits obligatoires
* Interdiction du tag latest
* Vérification des signatures d'images

### Network Policies

Restriction du trafic réseau entrant et sortant.

### HPA

Autoscaling basé sur l'utilisation CPU.

---

## 🔏 Sécurité de la Supply Chain

### SBOM

Génération automatique du Software Bill of Materials.

### Cosign

Signature automatique des images Docker.

### GitHub OIDC

Authentification sans clés AWS statiques.

### VerifyImages

Kyverno vérifie la signature des images avant déploiement.

Seules les images signées sont autorisées sur le cluster.

---

## ✅ Validation de sécurité

### Test d'image non signée

```bash
kubectl apply -f unsigned-ecr-pod.yaml
```

Résultat attendu :

```text
Error from server (Forbidden)
```

### Test d'un pod malveillant

```bash
kubectl run bad-pod --image=nginx:latest -n chatbot
```

Résultat :

```text
Bloqué par Pod Security Standards et Kyverno
```

---

## 📊 Fonctionnalités implémentées

✅ Terraform

✅ Amazon EKS

✅ Amazon ECR

✅ GitHub Actions

✅ Docker

✅ Trivy

✅ SBOM

✅ Cosign

✅ GitHub OIDC

✅ Kyverno

✅ VerifyImages

✅ Network Policies

✅ HPA

✅ Pod Security Standards

✅ AWS Load Balancer Controller

✅ Application Load Balancer

---

## 🚀 Améliorations futures

* Prometheus
* Grafana
* Alertmanager
* Falco
* Trivy Operator
* External Secrets Operator
* AWS Secrets Manager
* ArgoCD GitOps

---

## 👨‍💻 Auteur

Abdellah Omari

Cloud DevSecOps Engineer | AWS | Kubernetes | Terraform | Security

