# Metabase on GCP with Terraform

## 📌 Overview

This project demonstrates how to deploy **Metabase** with **PostgreSQL** on a Google Cloud VM using **Terraform** and **Docker Compose**.

The goal is to provision infrastructure and automatically deploy the application using a startup script.

---

## 🏗 Architecture

* **Compute**: Google Compute Engine (VM)
* **Container Runtime**: Docker
* **Orchestration**: Docker Compose
* **Database**: PostgreSQL (container)
* **Application**: Metabase
* **Provisioning**: Terraform

```
User → Public IP (Port 3000) → Metabase (Docker)
                                      ↓
                                PostgreSQL (Internal Docker Network)
```

---

## 🚀 Deployment Steps

### 1. Clone repository

```bash
git clone https://github.com/kengljr/metabase-gcp.git
cd metabase-gcp
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Apply infrastructure

```bash
terraform apply
```

---

### 4. Access Metabase

After deployment, open:

```
http://<PUBLIC_IP>:3000
```

---

## ⚙️ Configuration

### Environment Variables (`.env`)

Sensitive values are stored in a `.env` file and injected during deployment.

Example:

```env
POSTGRES_PASSWORD=yourpassword
MB_DB_PASS=yourpassword
```

---

## 🔐 Security Considerations

* Avoid hardcoding secrets in code
* Use `.env` for local development
* In production:

  * Use **Secret Manager**
  * Restrict firewall access (avoid `0.0.0.0/0`)
  * Use HTTPS via Load Balancer

---

## 📦 Terraform Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── scripts/
│   └── startup.sh
├── docker/
│   ├── docker-compose.yaml
│   └── .env
```

---

## 💡 Design Decisions

### Why VM instead of Kubernetes?

* Simpler setup
* Faster deployment
* Suitable for small workloads

Kubernetes (GKE) would be more appropriate for:

* High scalability
* Microservices architecture
* Production-grade systems

---

## 🚀 Improvements (Future Work)

* Use **Cloud SQL** instead of containerized PostgreSQL
* Add CI/CD pipeline (e.g., GitHub Actions)
* Implement HTTPS with Load Balancer
* Use GCP Secret Manager for secrets
* Migrate to Kubernetes (GKE)

---

## 👨‍💻 Author

Chalermrat Laojarungphesatchakorn

---

## 📄 License

MIT License
