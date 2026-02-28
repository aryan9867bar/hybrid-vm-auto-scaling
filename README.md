# 📘 Virtualization and Cloud Computing Assignment 3

---

## 📌 Title

Hybrid Local VM to Google Cloud Auto-Scaling Based on Resource Utilization

---

## 📚 Course

Virtualization and Cloud Computing  

---

## 🎯 Objective

This assignment demonstrates the implementation of a hybrid virtualization system where a Local Ubuntu Virtual Machine continuously monitors CPU and memory utilization. When resource usage exceeds 75%, the system automatically provisions a new Virtual Machine on Google Cloud Platform (GCP) and deploys a Flask-based web application. The objective is to simulate real-world cloud elasticity by integrating local virtualization with automated public cloud scaling.

---

## 🛠 Technologies Used

- Google Cloud Platform (Compute Engine, Firewall Rules)
- Ubuntu 24.04 LTS
- VirtualBox
- Google Cloud CLI (gcloud)
- Python 3
- Flask
- Bash Scripting
- stress-ng (Load Testing Utility)

---

## ☁ Virtual Machine Configuration

| Component | Role | Technology |
|-----------|------|------------|
| Local VM | Monitoring Node | Ubuntu 24.04 on VirtualBox |
| Monitoring Script | Resource Checker | Bash Script |
| GCP VM | Scaled Application Server | Ubuntu 24.04 |
| Firewall Rule | Network Security | TCP 80, SSH 22 |
| SSH Key | Secure Authentication | RSA 4096-bit |

The Local VM acts as the monitoring controller, while the GCP VM acts as the dynamically provisioned application server.

---

## 🏗 System Architecture

### User / Client
- Accesses the application through a web browser.

### Local Monitoring Layer
- Runs CPU and RAM monitoring script.
- Checks if usage exceeds 75%.
- Triggers cloud provisioning script.

### Cloud Layer (Google Compute Engine)
- Automatically creates a VM instance.
- Installs Python and Flask.
- Deploys the web application.
- Exposes public IP.

### Scale-Down Mechanism
- Termination script removes instance when load decreases.

---

## 🖼 Architecture Diagram

![Hybrid Architecture](Aryan Baranwal (M25CSE035) VCC Assignment 3.png)

Figure: Hybrid auto-scaling architecture from Local VM to Google Cloud based on CPU/RAM threshold.

---

## 🚀 Implementation Overview

### Local Setup
```bash
sudo apt update && sudo apt upgrade -y  
sudo apt install -y curl git bc stress-ng htop python3-pip  
pip3 install flask  
```
---

### Google Cloud CLI Setup
```bash
curl https://sdk.cloud.google.com | bash  
exec -l \$SHELL  
gcloud init  
gcloud config set project YOUR_PROJECT_ID  
```
---

### Firewall Configuration
```bash
gcloud compute firewall-rules create allow-http \\
--allow tcp:80 \\
--target-tags=http-server  
```
---

## 📂 Repository Structure

assignment3-hybrid-autoscaling/  
│── app.py  
│── cpu_monitor.sh  
│── migrate_to_gcp.sh  
│── terminate_gcp.sh  
│── README.md  
│── Aryan Baranwal (M25CSE035) VCC Assignment 3.png  
│── Assignment3_Report.pdf  

---

## 🔗 Application Endpoints

### Local Endpoint
```bash
http://<LOCAL_VM_IP>:5000  
```
Response:  
LOCAL FLASK APP RUNNING  

---

### Cloud Endpoint (After Scaling)
```bash
http://<EXTERNAL_IP>  
```
Response:  
AUTO SCALED FLASK APP ON GCP  

---

## 📈 Auto-Scaling Behavior

- CPU and RAM monitored in real time  
- Threshold set to 75%  
- If exceeded → GCP VM is created  
- Flask app deployed automatically  
- When load decreases → Instance can be terminated  
- Public access enabled via firewall rule  

---

## 🧪 Load Testing
```bash
stress-ng --cpu \$(nproc) --cpu-load 90 --timeout 120s  
```
---

## 📄 Assignment Report (PDF)

Click here to view the Assignment 3 Report: Assignment3_Report.pdf  

---

## 🎓 Learning Outcomes

- Practical implementation of hybrid cloud architecture  
- Resource monitoring using Bash scripting  
- Automated VM provisioning using Google Cloud CLI  
- Threshold-based auto-scaling mechanism  
- Secure deployment using SSH keys and firewall rules  
- Hands-on understanding of Infrastructure as Code concepts  

---

## 👤 Author

Aryan Baranwal  
Roll No: M25CSE035  
M.Tech (CSE)  

---

## ⚠ Note

This repository is created strictly for academic purposes as part of the Virtualization and Cloud Computing coursework.
