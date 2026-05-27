# Kube DevOps App

A production-grade DevOps project demonstrating end-to-end CI/CD pipeline
with Kubernetes on AWS EKS.

## Architecture
Developer pushes code
↓
GitHub Actions triggered
↓
Docker image built & pushed to Docker Hub
↓
Deployed to AWS EKS automatically
↓
Monitored by Prometheus & Grafana

## Tech Stack

| Tool | Purpose |
|------|---------|
| Docker | Containerization |
| Kubernetes (EKS) | Container orchestration |
| Terraform | Infrastructure as Code |
| GitHub Actions | CI/CD Pipeline |
| Prometheus | Metrics collection |
| Grafana | Monitoring dashboards |
| AWS (EKS, VPC, IAM, ELB) | Cloud infrastructure |

## Project Structure
├── index.html          # Application
├── style.css           # Styling
├── Dockerfile          # Container definition
├── k8s/
│   └── deployment.yaml # Kubernetes manifests
├── terraform/
│   ├── main.tf         # AWS infrastructure
│   └── outputs.tf      # Terraform outputs
└── .github/
└── workflows/
└── deploy.yml  # CI/CD pipeline

## CI/CD Pipeline

Every push to `main` branch:
1. Builds Docker image
2. Pushes to Docker Hub
3. Deploys to AWS EKS automatically
4. Zero downtime rolling update

## Infrastructure (Terraform)

- VPC with public subnets across 2 AZs
- EKS cluster (Kubernetes v1.31)
- Managed node group (t3.small)
- AWS Load Balancer for external access
- IAM roles with least privilege

## Monitoring

- Prometheus scrapes metrics from all pods
- Grafana dashboards for CPU, memory, network
- Namespace-level resource tracking

## How to Deploy

### Prerequisites
- AWS CLI configured
- Terraform installed
- kubectl installed

### Spin up infrastructure
```bash
cd terraform
terraform init
terraform apply
aws eks update-kubeconfig --region ap-northeast-2 --name arbin-eks-cluster
```

### Deploy application
```bash
kubectl apply -f k8s/deployment.yaml
```

### Install monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace
```

## Author
**Arbin Sapkota** — Cloud & DevOps Engineer
- Email: arbinsapkota2056@gmail.com
- Location: Kathmandu, Nepal