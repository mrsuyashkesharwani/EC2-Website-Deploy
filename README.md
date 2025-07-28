# EC2 Website Deploy

Automates provisioning of an AWS EC2 instance and deploying a static HTML/CSS website using Terraform.

---

## 🚀 About

This repository uses **Terraform** (`main.tf`, `provide.tf`) to spin up an EC2 instance and configure it to serve a static website. Relevant screenshots are included for visual confirmation.

---

## 🔧 Prerequisites

* An **AWS account** with access credentials (IAM user or root with sufficient rights).
* **Terraform** installed (v1.x recommended).
* A basic static website (e.g. `index.html`, `style.css`) ready for deployment.
* SSH key pair configured to access the instance.

---

## 🧱 Project Structure

```
.
├── main.tf           # Terraform configuration for AWS resources (EC2, security, provisioners)
├── provide.tf        # AWS provider settings and variables
├── .gitignore
├── .terraform.tfstate.lock.info
└── screenshots/      # Visual output of deployed website, console, etc.
```

---

## 📦 Deployment Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/mrsuyashkesharwani/EC2-Website-Deploy.git
   cd EC2-Website-Deploy
   ```

2. **Review and update Terraform files**

   * Edit `provide.tf` to include your AWS region, access keys, and any required variables.
   * Check SSH key filename and path in `main.tf` (used by provisioners).

3. **Initialize Terraform**

   ```bash
   terraform init
   ```

4. **Plan the deployment**

   ```bash
   terraform plan
   ```

5. **Apply changes to create resources**

   ```bash
   terraform apply
   ```

6. **Follow on-screen instructions**

   * Terraform will provision an EC2 instance, open security group ports (SSH 22 and HTTP 80).
   * Provisioners in `main.tf` will install and configure Apache or Nginx, and push your static website files onto the server.

7. **View your website**

   * After Terraform finishes, locate the EC2 public IP or DNS output.
   * Visit `http://<PUBLIC_IP>/` in your browser—your static site should be live.

---

## 🛠️ How It Works

* **Terraform** provisions:

  * EC2 instance (Amazon Linux / Ubuntu).
  * Security group for HTTP (80) and SSH (22).
  * (Optional) Elastic IP.
* **Provisioners** inside `main.tf`:

  * Connect via SSH.
  * Install web server (Apache or Nginx).
  * Upload your website files.
  * Start and enable the web server.

---

## ✅ What You’ll Achieve

* Independent, version-controlled infrastructure setup using Terraform.
* Automated provisioning of resources on AWS.
* A publicly accessible static website hosted on EC2.
* Reproducibility: simply change source files, re‑apply to redeploy.

---

## 🔐 Security Suggestions

* Restrict SSH ingress by IP rather than opening 0.0.0.0/0.
* Use IAM roles and policies with least privilege.
* Keep OS and web server packages up to date.
* If deploying in production, consider HTTPS via Certbot / Let's Encrypt.

---

## ⚙️ Customization

To tailor the deployment:

* Replace placeholder site files with your own static content.
* Modify Terraform variables for instance type, AMI ID, region.
* Extend provisioners to support advanced tooling (SSL, logging, monitoring).

---
