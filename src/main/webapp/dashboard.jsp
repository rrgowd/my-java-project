<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevOps Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    display: flex;
    height: 100vh;
    background: #f3f4f6;
}

/* Sidebar */
.sidebar {
    width: 260px;
    background: #111827;
    color: white;
    overflow-y: auto;
    padding: 20px 0;
    transition: 0.3s;
}

.sidebar h2 {
    text-align: center;
    margin: 0;
    padding: 10px;
    font-size: 20px;
    border-bottom: 1px solid #374151;
}

/* Search */
.search-box {
    padding: 15px;
}

.search-box input {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: none;
    outline: none;
    font-size: 14px;
}

/* Tool list */
.tool {
    padding: 12px 20px;
    cursor: pointer;
    border-bottom: 1px solid #1f2937;
    transition: 0.3s;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 15px;
}

.tool:hover {
    background: #1f2937;
}

.tool.active {
    background: #2563eb;
    font-weight: 600;
}

/* Main */
.main {
    flex: 1;
    display: flex;
    flex-direction: column;
}

/* Top bar */
.topbar {
    background: linear-gradient(to right, #2563eb, #1e40af);
    padding: 18px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    box-shadow: 0 2px 15px rgba(0,0,0,0.2);
}

.topbar h3 {
    margin: 0;
    font-size: 18px;
}

/* Logout */
.logout-btn {
    background: #ef4444;
    padding: 9px 18px;
    border-radius: 8px;
    text-decoration: none;
    color: white;
    font-size: 14px;
    font-weight: 500;
    transition: 0.3s;
}

.logout-btn:hover {
    background: #dc2626;
}

/* Content */
.content {
    padding: 30px;
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Card */
.card {
    background: white;
    width: 80%;
    max-width: 850px;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    animation: fadeIn 0.5s ease-in-out;
}

.card h1 {
    margin-top: 0;
    font-size: 28px;
    color: #111827;
}

.card p {
    font-size: 16px;
    color: #4b5563;
    line-height: 1.8;
}

/* Animation */
@keyframes fadeIn {
    from {opacity: 0; transform: translateY(10px);}
    to {opacity: 1; transform: translateY(0);}
}

/* Responsive */
@media(max-width: 768px) {
    .sidebar {
        width: 200px;
    }
    .card {
        width: 95%;
    }
}
</style>

<script>
let data = {
    "Linux": `
<h2>🐧 What is Linux?</h2>
<p>Linux is an open-source operating system widely used for servers, cloud, and DevOps. 
It is stable, secure, and supports automation with shell scripting.</p>

<h3>📌 What is a Line in Linux?</h3>
<p>A line in Linux is a single row of text in a file or terminal.</p>
<ul>
<li>It starts when you type something</li>
<li>It ends when you press Enter</li>
<li>Many Linux tools process files line by line</li>
</ul>

<h4>Example:</h4>
<pre>
Hello
Linux
World
</pre>

<p>This file has <b>3 lines</b>.</p>

<h3>🛠 Commands That Work With Lines</h3>
<ul>
<li><b>wc -l</b> → Counts number of lines</li>
<li><b>head</b> → Shows first lines</li>
<li><b>tail</b> → Shows last lines</li>
<li><b>grep</b> → Searches lines containing specific words</li>
</ul>

<h3>🚀 Uses of Linux</h3>
<ul>
<li>Servers and websites</li>
<li>Programming and development</li>
<li>Cybersecurity</li>
<li>Supercomputers</li>
<li>Android phones (Android is based on Linux)</li>
</ul>

<h3>⭐ Why Linux is Popular</h3>
<ul>
<li>Free and open-source</li>
<li>Secure</li>
<li>Stable</li>
<li>Fast</li>
</ul>

<h3>📂 Important Linux Commands</h3>

<h4>File & Directory Commands</h4>
<ul>
<li><b>ls</b> → List files and folders</li>
<li><b>cd</b> → Change directory</li>
<li><b>pwd</b> → Show current directory</li>
<li><b>mkdir</b> → Create new folder</li>
<li><b>rm</b> → Delete file</li>
<li><b>cp</b> → Copy file</li>
<li><b>mv</b> → Move or rename file</li>
</ul>

<h4>File Viewing Commands</h4>
<ul>
<li><b>cat</b> → Show file content</li>
<li><b>less</b> → View file page by page</li>
<li><b>head</b> → Show first 10 lines</li>
<li><b>tail</b> → Show last 10 lines</li>
</ul>

<h4>Search & Text Commands</h4>
<ul>
<li><b>grep</b> → Search text in files</li>
<li><b>wc</b> → Count words, lines, characters</li>
</ul>
`,
    "Git": `
<h2>🌿 What is Git?</h2>
<p>Git is a distributed version control system used to track code changes, 
collaborate with teams, and manage different versions of a project.</p>

<h3>📌 Why Git is Important?</h3>
<ul>
<li>Tracks code history</li>
<li>Supports teamwork</li>
<li>Allows branching and merging</li>
<li>Prevents code conflicts</li>
<li>Enables rollback to previous versions</li>
</ul>

<h3>🧠 Key Concepts in Git</h3>

<h4>Repository (Repo)</h4>
<p>A repository stores your project files and full version history.</p>

<h4>Commit</h4>
<p>A commit is a snapshot of changes made to files.</p>

<h4>Branch</h4>
<p>A branch allows you to work on new features without affecting the main project.</p>

<h4>Merge</h4>
<p>Merging combines changes from one branch into another.</p>

<h3>📂 Basic Git Commands</h3>

<h4>🔹 Repository Commands</h4>
<ul>
<li><b>git init</b> → Create new repository</li>
<li><b>git clone</b> → Copy repository from remote</li>
</ul>

<h4>🔹 Tracking Changes</h4>
<ul>
<li><b>git status</b> → Check file status</li>
<li><b>git add</b> → Stage files</li>
<li><b>git commit -m "message"</b> → Save changes</li>
</ul>

<h4>🔹 Branching</h4>
<ul>
<li><b>git branch</b> → Show branches</li>
<li><b>git checkout branch-name</b> → Switch branch</li>
<li><b>git merge branch-name</b> → Merge branch</li>
</ul>

<h4>🔹 Remote Commands</h4>
<ul>
<li><b>git remote -v</b> → Show remote repo</li>
<li><b>git push</b> → Upload changes</li>
<li><b>git pull</b> → Download latest changes</li>
</ul>

<h3>🚀 Example Workflow</h3>
<pre>
git init
git add .
git commit -m "Initial commit"
git branch feature-login
git checkout feature-login
git merge feature-login
</pre>

<p>This workflow creates a project, commits changes, creates a branch, 
and merges it back.</p>

<h3>⭐ Advantages of Git</h3>
<ul>
<li>Fast and efficient</li>
<li>Distributed system (no central dependency)</li>
<li>Strong branching support</li>
<li>Free and open-source</li>
</ul>
`,
    "GitHub": `
<h2>🐙 What is GitHub?</h2>
<p>GitHub is a cloud-based platform used to host Git repositories. 
It allows developers to store, manage, and collaborate on code projects online.</p>

<h3>📌 Why Use GitHub?</h3>
<ul>
<li>Store code securely in the cloud</li>
<li>Collaborate with teams</li>
<li>Track issues and bugs</li>
<li>Automate CI/CD workflows</li>
<li>Manage open-source projects</li>
</ul>

<h3>🧠 Key Features of GitHub</h3>

<h4>📂 Repositories</h4>
<p>A repository stores your project files, version history, and documentation.</p>

<h4>🔁 Pull Requests (PR)</h4>
<p>Pull Requests allow developers to propose changes before merging into the main branch.</p>

<h4>🐞 Issues</h4>
<p>Issues are used to track bugs, tasks, and feature requests.</p>

<h4>🔄 GitHub Actions</h4>
<p>GitHub Actions provides CI/CD automation for building, testing, and deploying code.</p>

<h4>👥 Collaboration</h4>
<p>Multiple developers can contribute to the same project using branches and pull requests.</p>

<h3>📂 Common GitHub Workflow</h3>

<pre>
1. Create repository
2. Clone repository
3. Create new branch
4. Make changes
5. Commit and push
6. Create Pull Request
7. Merge into main
</pre>

<h3>🔐 GitHub Access Types</h3>
<ul>
<li><b>Public Repository</b> → Anyone can view</li>
<li><b>Private Repository</b> → Only invited users can access</li>
</ul>

<h3>🚀 GitHub in DevOps</h3>
<ul>
<li>Code hosting</li>
<li>CI/CD automation using GitHub Actions</li>
<li>Infrastructure automation</li>
<li>Version tracking</li>
</ul>

<h3>⭐ Advantages of GitHub</h3>
<ul>
<li>Easy collaboration</li>
<li>Cloud-based storage</li>
<li>Built-in CI/CD</li>
<li>Strong open-source community</li>
</ul>
`,
    "Jenkins": `
<h2>🤖 What is Jenkins?</h2>
<p>Jenkins is an open-source CI/CD automation tool used to build, test, 
and deploy applications automatically.</p>

<h3>📌 What is CI/CD?</h3>
<ul>
<li><b>CI (Continuous Integration)</b> → Automatically build and test code when developers push changes.</li>
<li><b>CD (Continuous Delivery/Deployment)</b> → Automatically deploy application after successful testing.</li>
</ul>

<h3>🚀 Why Use Jenkins?</h3>
<ul>
<li>Automates build process</li>
<li>Runs automated tests</li>
<li>Deploys applications</li>
<li>Integrates with GitHub, Docker, Maven, etc.</li>
<li>Reduces manual work</li>
</ul>

<h3>🧠 Important Jenkins Concepts</h3>

<h4>📂 Job</h4>
<p>A Job is a task or process Jenkins performs (build, test, deploy).</p>

<h4>📜 Pipeline</h4>
<p>A Pipeline defines the complete CI/CD workflow using a Jenkinsfile.</p>

<h4>🔌 Plugins</h4>
<p>Jenkins supports thousands of plugins to integrate with other tools.</p>

<h4>👷 Agent</h4>
<p>An Agent is a machine that executes build jobs.</p>

<h3>📄 Sample Jenkins Pipeline</h3>

<pre>
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building project...'
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
</pre>

<h3>🔄 Typical Jenkins Workflow</h3>
<ul>
<li>Developer pushes code to GitHub</li>
<li>Jenkins detects change</li>
<li>Build is triggered</li>
<li>Tests run automatically</li>
<li>If successful → Deploy</li>
</ul>

<h3>⭐ Advantages of Jenkins</h3>
<ul>
<li>Free and open-source</li>
<li>Highly customizable</li>
<li>Large plugin ecosystem</li>
<li>Supports many programming languages</li>
</ul>
`,
    "Docker": `
<h2>🐳 What is Docker?</h2>
<p>Docker is a containerization platform that packages applications 
and their dependencies into containers. Containers ensure that 
applications run the same in development, testing, and production.</p>

<h3>📌 What is a Container?</h3>
<p>A container is a lightweight, standalone package that includes:</p>
<ul>
<li>Application code</li>
<li>Runtime</li>
<li>Libraries</li>
<li>System tools</li>
<li>Dependencies</li>
</ul>

<p>Containers are faster and lighter than virtual machines.</p>

<h3>🧠 Why Use Docker?</h3>
<ul>
<li>Works the same everywhere</li>
<li>Lightweight and fast</li>
<li>Easy deployment</li>
<li>Isolation between applications</li>
<li>Scalable microservices architecture</li>
</ul>

<h3>📂 Important Docker Components</h3>

<h4>📦 Docker Image</h4>
<p>A Docker Image is a blueprint used to create containers.</p>

<h4>📦 Docker Container</h4>
<p>A running instance of a Docker image.</p>

<h4>📄 Dockerfile</h4>
<p>A text file containing instructions to build a Docker image.</p>

<h4>📦 Docker Hub</h4>
<p>A cloud repository where Docker images are stored and shared.</p>

<h3>📄 Sample Dockerfile</h3>

<pre>
FROM openjdk:17
COPY target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
</pre>

<h3>🔧 Common Docker Commands</h3>

<ul>
<li><b>docker build -t app-name .</b> → Build image</li>
<li><b>docker images</b> → List images</li>
<li><b>docker run image-name</b> → Run container</li>
<li><b>docker ps</b> → Show running containers</li>
<li><b>docker stop container-id</b> → Stop container</li>
<li><b>docker rm container-id</b> → Remove container</li>
<li><b>docker rmi image-name</b> → Remove image</li>
</ul>

<h3>🔄 Docker in DevOps Workflow</h3>
<ul>
<li>Developer builds Docker image</li>
<li>Pushes image to Docker Hub</li>
<li>Deployment server pulls image</li>
<li>Container runs application</li>
</ul>

<h3>⭐ Advantages of Docker</h3>
<ul>
<li>Consistent environments</li>
<li>Fast deployment</li>
<li>Resource efficient</li>
<li>Supports microservices</li>
</ul>
`,
    "Kubernetes": `
<h2>☸️ What is Kubernetes?</h2>
<p>Kubernetes (K8s) is a container orchestration platform used to manage, 
scale, and deploy containerized applications automatically.</p>

<h3>📌 Why Kubernetes?</h3>
<ul>
<li>Manages multiple containers</li>
<li>Auto-scaling applications</li>
<li>Self-healing (restarts failed containers)</li>
<li>Load balancing</li>
<li>Rolling updates and rollbacks</li>
</ul>

<h3>🧠 Important Kubernetes Concepts</h3>

<h4>📦 Pod</h4>
<p>The smallest unit in Kubernetes. A Pod contains one or more containers.</p>

<h4>🚀 Deployment</h4>
<p>Manages application updates and scaling.</p>

<h4>🌐 Service</h4>
<p>Exposes Pods to internal or external traffic.</p>

<h4>📦 Node</h4>
<p>A worker machine that runs containers.</p>

<h4>🏢 Cluster</h4>
<p>A group of nodes managed by Kubernetes.</p>

<h3>📄 Sample Deployment YAML</h3>

<pre>
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app
        image: myapp:latest
        ports:
        - containerPort: 8080
</pre>

<h3>🔧 Common kubectl Commands</h3>
<ul>
<li><b>kubectl get pods</b> → List pods</li>
<li><b>kubectl get services</b> → List services</li>
<li><b>kubectl apply -f file.yaml</b> → Deploy configuration</li>
<li><b>kubectl delete pod pod-name</b> → Delete pod</li>
<li><b>kubectl describe pod pod-name</b> → View details</li>
</ul>

<h3>🔄 Kubernetes in DevOps Workflow</h3>
<ul>
<li>Build Docker image</li>
<li>Push to registry</li>
<li>Deploy using Kubernetes</li>
<li>Scale application automatically</li>
</ul>

<h3>⭐ Advantages of Kubernetes</h3>
<ul>
<li>Automated container management</li>
<li>High availability</li>
<li>Scalability</li>
<li>Cloud-native architecture</li>
</ul>
`,
    "Ansible": `
<h2>⚙️ What is Ansible?</h2>
<p>Ansible is an open-source automation tool used for configuration management, 
application deployment, and infrastructure automation.</p>

<h3>📌 Why Use Ansible?</h3>
<ul>
<li>Automates server configuration</li>
<li>Deploys applications</li>
<li>Manages infrastructure</li>
<li>Agentless (uses SSH)</li>
<li>Simple YAML-based syntax</li>
</ul>

<h3>🧠 Important Ansible Concepts</h3>

<h4>📄 Playbook</h4>
<p>A YAML file that defines automation tasks.</p>

<h4>📦 Inventory</h4>
<p>A file that lists target servers.</p>

<h4>📌 Task</h4>
<p>A single action performed on a server.</p>

<h4>🔧 Module</h4>
<p>Reusable scripts used to perform actions (copy, install, service, etc.).</p>

<h3>📄 Sample Ansible Playbook</h3>

<pre>
- name: Install Nginx
  hosts: webservers
  become: yes

  tasks:
    - name: Install nginx package
      apt:
        name: nginx
        state: present
</pre>

<h3>🔧 Common Ansible Commands</h3>
<ul>
<li><b>ansible --version</b> → Check version</li>
<li><b>ansible all -m ping</b> → Test connection</li>
<li><b>ansible-playbook playbook.yml</b> → Run playbook</li>
<li><b>ansible-inventory --list</b> → Show inventory</li>
</ul>

<h3>🔄 Ansible in DevOps Workflow</h3>
<ul>
<li>Provision servers</li>
<li>Install required software</li>
<li>Configure services</li>
<li>Deploy applications</li>
</ul>

<h3>⭐ Advantages of Ansible</h3>
<ul>
<li>Agentless architecture</li>
<li>Simple YAML syntax</li>
<li>Easy to learn</li>
<li>Works with cloud platforms</li>
</ul>
`,
    "Helm": `
<h2>⛵ What is Helm?</h2>
<p>Helm is a package manager for Kubernetes. It helps you install, 
upgrade, and manage Kubernetes applications using reusable templates 
called charts.</p>

<h3>📌 Why Use Helm?</h3>
<ul>
<li>Simplifies Kubernetes deployments</li>
<li>Reusable configuration templates</li>
<li>Easy upgrades and rollbacks</li>
<li>Version management for applications</li>
<li>Reduces YAML complexity</li>
</ul>

<h3>🧠 Important Helm Concepts</h3>

<h4>📦 Chart</h4>
<p>A Helm Chart is a package containing Kubernetes YAML files.</p>

<h4>🚀 Release</h4>
<p>A running instance of a Helm chart inside a Kubernetes cluster.</p>

<h4>📁 values.yaml</h4>
<p>A file used to customize configuration values.</p>

<h4>📚 Helm Repository</h4>
<p>A collection of Helm charts (like Docker Hub but for Helm).</p>

<h3>📄 Helm Chart Structure</h3>

<pre>
mychart/
  Chart.yaml
  values.yaml
  templates/
  charts/
</pre>

<h3>🔧 Common Helm Commands</h3>
<ul>
<li><b>helm version</b> → Check version</li>
<li><b>helm repo add</b> → Add repository</li>
<li><b>helm repo update</b> → Update repo list</li>
<li><b>helm install app-name chart-name</b> → Install chart</li>
<li><b>helm list</b> → List releases</li>
<li><b>helm upgrade app-name chart-name</b> → Upgrade release</li>
<li><b>helm rollback app-name 1</b> → Rollback to previous version</li>
<li><b>helm uninstall app-name</b> → Remove release</li>
</ul>

<h3>🔄 Helm in DevOps Workflow</h3>
<ul>
<li>Build Docker image</li>
<li>Push image to registry</li>
<li>Deploy using Helm chart</li>
<li>Upgrade application with helm upgrade</li>
</ul>

<h3>⭐ Advantages of Helm</h3>
<ul>
<li>Reusable deployment templates</li>
<li>Easy Kubernetes management</li>
<li>Supports CI/CD pipelines</li>
<li>Version-controlled deployments</li>
</ul>
`,
    "AWS": `
<h2>☁️ What is AWS?</h2>
<p>AWS (Amazon Web Services) is a cloud computing platform that provides 
on-demand infrastructure and services like servers, storage, databases, 
networking, and more.</p>

<h3>📌 Why Use AWS?</h3>
<ul>
<li>Scalable cloud infrastructure</li>
<li>Pay-as-you-go pricing</li>
<li>Global data centers</li>
<li>High availability</li>
<li>Secure and reliable</li>
</ul>

<h3>🧠 Important AWS Services</h3>

<h4>🖥 EC2 (Elastic Compute Cloud)</h4>
<p>Virtual servers used to run applications.</p>

<h4>💾 S3 (Simple Storage Service)</h4>
<p>Object storage for files, backups, and static websites.</p>

<h4>🗄 RDS (Relational Database Service)</h4>
<p>Managed relational databases like MySQL, PostgreSQL, etc.</p>

<h4>🌐 VPC (Virtual Private Cloud)</h4>
<p>Private network environment inside AWS.</p>

<h4>🔐 IAM (Identity and Access Management)</h4>
<p>Manages users, roles, and permissions.</p>

<h4>☸️ EKS (Elastic Kubernetes Service)</h4>
<p>Managed Kubernetes service.</p>

<h3>🔄 AWS in DevOps Workflow</h3>
<ul>
<li>Launch EC2 servers</li>
<li>Store files in S3</li>
<li>Deploy containers using EKS</li>
<li>Use RDS for databases</li>
<li>Manage permissions using IAM</li>
</ul>

<h3>🔧 Common AWS CLI Commands</h3>

<pre>
aws ec2 describe-instances
aws s3 ls
aws configure
aws ec2 start-instances --instance-ids i-123456
</pre>

<h3>⭐ Advantages of AWS</h3>
<ul>
<li>Highly scalable</li>
<li>Secure infrastructure</li>
<li>Large number of services</li>
<li>Global cloud provider</li>
</ul>
`,
    "Grafana": `
<h2>📊 What is Grafana?</h2>
<p>Grafana is an open-source monitoring and visualization tool 
used to create dashboards from multiple data sources like Prometheus, 
Elasticsearch, Loki, and more.</p>

<h3>📌 Why Use Grafana?</h3>
<ul>
<li>Real-time monitoring dashboards</li>
<li>Beautiful visual charts and graphs</li>
<li>Supports multiple data sources</li>
<li>Alerting system</li>
<li>Easy integration with DevOps tools</li>
</ul>

<h3>🧠 Important Grafana Concepts</h3>

<h4>📊 Dashboard</h4>
<p>A dashboard is a collection of panels that display metrics visually.</p>

<h4>📈 Panel</h4>
<p>A panel is a single graph or visualization inside a dashboard.</p>

<h4>🔗 Data Source</h4>
<p>The system from which Grafana collects metrics (Prometheus, MySQL, etc.).</p>

<h4>🚨 Alerting</h4>
<p>Send notifications when metrics exceed thresholds.</p>

<h3>🔄 Grafana in DevOps Workflow</h3>
<ul>
<li>Prometheus collects metrics</li>
<li>Grafana connects to Prometheus</li>
<li>Dashboards show CPU, memory, traffic</li>
<li>Alerts notify if something fails</li>
</ul>

<h3>📂 Example Metrics Monitored</h3>
<ul>
<li>CPU Usage</li>
<li>Memory Usage</li>
<li>Disk Usage</li>
<li>Application Response Time</li>
<li>HTTP Request Count</li>
</ul>

<h3>⭐ Advantages of Grafana</h3>
<ul>
<li>User-friendly interface</li>
<li>Customizable dashboards</li>
<li>Powerful alerting</li>
<li>Open-source and widely used</li>
</ul>
`,
    "Prometheus": `
<h2>🔥 What is Prometheus?</h2>
<p>Prometheus is an open-source monitoring and alerting toolkit 
used to collect and store time-series metrics from applications and servers.</p>

<h3>📌 Why Use Prometheus?</h3>
<ul>
<li>Real-time metrics collection</li>
<li>Powerful query language (PromQL)</li>
<li>Alerting system</li>
<li>Works well with Kubernetes</li>
<li>Integrates with Grafana</li>
</ul>

<h3>🧠 Important Concepts</h3>

<h4>📊 Metrics</h4>
<p>Numerical data collected over time (CPU, memory, requests).</p>

<h4>🎯 Target</h4>
<p>System or application from which metrics are collected.</p>

<h4>📄 PromQL</h4>
<p>Prometheus Query Language used to query metrics.</p>

<h4>🚨 Alertmanager</h4>
<p>Handles alerts and sends notifications.</p>

<h3>🔧 Common Prometheus Queries</h3>
<pre>
up
rate(http_requests_total[5m])
node_cpu_seconds_total
</pre>

<h3>🔄 DevOps Workflow</h3>
<ul>
<li>Prometheus collects metrics</li>
<li>Stores time-series data</li>
<li>Grafana visualizes data</li>
<li>Alertmanager sends alerts</li>
</ul>

<h3>⭐ Advantages</h3>
<ul>
<li>Cloud-native monitoring</li>
<li>Scalable</li>
<li>Strong Kubernetes integration</li>
</ul>
`,
    "ArgoCD": `
<h2>🚀 What is ArgoCD?</h2>
<p>ArgoCD is a GitOps continuous delivery tool for Kubernetes. 
It automatically deploys applications from Git repositories.</p>

<h3>📌 What is GitOps?</h3>
<p>GitOps means managing infrastructure and applications using Git as the single source of truth.</p>

<h3>🧠 Key Concepts</h3>

<h4>📂 Application</h4>
<p>A deployed Kubernetes application managed by ArgoCD.</p>

<h4>🔄 Sync</h4>
<p>Ensures cluster state matches Git repository state.</p>

<h4>📊 UI Dashboard</h4>
<p>Web interface to monitor deployments.</p>

<h3>🔧 Common Commands</h3>
<pre>
argocd app create
argocd app sync
argocd app list
</pre>

<h3>⭐ Advantages</h3>
<ul>
<li>Automated deployments</li>
<li>Version-controlled infrastructure</li>
<li>Kubernetes-native</li>
</ul>
`,
    "Chef": `
<h2>👨‍🍳 What is Chef?</h2>
<p>Chef is a configuration management tool used to automate infrastructure setup.</p>

<h3>🧠 Key Concepts</h3>
<ul>
<li><b>Cookbook</b> → Collection of configuration recipes</li>
<li><b>Recipe</b> → Defines tasks</li>
<li><b>Node</b> → Managed server</li>
</ul>

<h3>📄 Sample Chef Recipe</h3>
<pre>
package 'nginx' do
  action :install
end
</pre>

<h3>⭐ Advantages</h3>
<ul>
<li>Automated configuration</li>
<li>Infrastructure consistency</li>
<li>Scalable server management</li>
</ul>
`,
    "Maven": `
<h2>📦 What is Maven?</h2>
<p>Maven is a build automation and dependency management tool for Java projects.</p>

<h3>📌 Why Maven?</h3>
<ul>
<li>Manages project dependencies</li>
<li>Automates build process</li>
<li>Standard project structure</li>
<li>Integrates with Jenkins</li>
</ul>

<h3>📄 pom.xml Structure</h3>
<pre>
<project>
  <groupId>com.example</groupId>
  <artifactId>demo</artifactId>
  <version>1.0</version>
</project>
</pre>

<h3>🔧 Common Commands</h3>
<ul>
<li><b>mvn clean</b></li>
<li><b>mvn compile</b></li>
<li><b>mvn package</b></li>
<li><b>mvn install</b></li>
</ul>
`,
    "SonarQube": `
<h2>🔍 What is SonarQube?</h2>
<p>SonarQube is a code quality and security analysis tool.</p>

<h3>📌 Features</h3>
<ul>
<li>Detects bugs</li>
<li>Finds vulnerabilities</li>
<li>Code coverage analysis</li>
<li>Quality gates</li>
</ul>

<h3>🔄 DevOps Integration</h3>
<ul>
<li>Runs during CI pipeline</li>
<li>Analyzes code</li>
<li>Blocks deployment if quality fails</li>
</ul>

<h3>⭐ Benefits</h3>
<ul>
<li>Improves code quality</li>
<li>Enhances security</li>
<li>Maintains coding standards</li>
</ul>
`,
    "Nexus": `
<h2>🏛 What is Nexus?</h2>
<p>Nexus is an artifact repository manager used to store and manage build artifacts.</p>

<h3>📌 What are Artifacts?</h3>
<ul>
<li>JAR files</li>
<li>Docker images</li>
<li>npm packages</li>
<li>Maven dependencies</li>
</ul>

<h3>🧠 Why Use Nexus?</h3>
<ul>
<li>Central artifact storage</li>
<li>Speeds up builds</li>
<li>Secure dependency management</li>
</ul>

<h3>🔄 DevOps Workflow</h3>
<ul>
<li>Build project using Maven</li>
<li>Upload artifact to Nexus</li>
<li>Deployment server downloads artifact</li>
</ul>

<h3>⭐ Advantages</h3>
<ul>
<li>Dependency caching</li>
<li>Repository management</li>
<li>Improves CI/CD efficiency</li>
</ul>
`,
   "Terraform": `
<h2>🌍 What is Terraform?</h2>
<p>Terraform is an Infrastructure as Code (IaC) tool used to create, manage, 
and automate cloud resources using configuration files.</p>

<h3>📌 What is Infrastructure as Code (IaC)?</h3>
<p>IaC means managing infrastructure (servers, networks, databases) 
using code instead of manual setup.</p>

<ul>
<li>Automated infrastructure provisioning</li>
<li>Version-controlled infrastructure</li>
<li>Reusable configuration</li>
<li>Consistent environments</li>
</ul>

<h3>🧠 Key Terraform Concepts</h3>

<h4>📄 Configuration File</h4>
<p>Written in HCL (HashiCorp Configuration Language).</p>

<h4>📦 Provider</h4>
<p>Defines which cloud platform to use (AWS, Azure, GCP, etc.).</p>

<h4>📌 Resource</h4>
<p>A cloud component like EC2 instance, S3 bucket, VPC, etc.</p>

<h4>📁 State File</h4>
<p>Stores the current infrastructure state.</p>

<h3>📄 Sample Terraform Code</h3>

<pre>
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
</pre>

<h3>🔧 Common Terraform Commands</h3>
<ul>
<li><b>terraform init</b> → Initialize project</li>
<li><b>terraform plan</b> → Show execution plan</li>
<li><b>terraform apply</b> → Create infrastructure</li>
<li><b>terraform destroy</b> → Remove infrastructure</li>
<li><b>terraform validate</b> → Validate configuration</li>
</ul>

<h3>🔄 Terraform in DevOps Workflow</h3>
<ul>
<li>Write infrastructure code</li>
<li>Commit to Git repository</li>
<li>CI/CD pipeline runs terraform apply</li>
<li>Cloud infrastructure is created automatically</li>
</ul>

<h3>⭐ Advantages of Terraform</h3>
<ul>
<li>Cloud-agnostic (multi-cloud support)</li>
<li>Version-controlled infrastructure</li>
<li>Reusable modules</li>
<li>Automated provisioning</li>
</ul>
`
};

let icons = {
    "Linux": "🐧",
    "Git": "🌿",
    "GitHub": "🐙",
    "Jenkins": "🤖",
    "Docker": "🐳",
    "Kubernetes": "☸️",
    "Ansible": "⚙️",
    "Helm": "⛵",
    "AWS": "☁️",
    "Grafana": "📊",
    "Prometheus": "🔥",
    "ArgoCD": "🚀",
    "Chef": "👨‍🍳",
    "Maven": "📦",
    "SonarQube": "🔍",
    "Nexus": "🏛️",
    "Terraform": "🌍"
};

function loadTool(name, element) {
    document.getElementById("toolTitle").innerText = icons[name] + " " + name;
    document.getElementById("toolDesc").innerHTML = data[name];

    let tools = document.getElementsByClassName("tool");
    for (let i = 0; i < tools.length; i++) {
        tools[i].classList.remove("active");
    }
    element.classList.add("active");
}

function searchTool() {
    let input = document.getElementById("searchInput").value.toLowerCase();
    let tools = document.getElementsByClassName("tool");

    for (let i = 0; i < tools.length; i++) {
        let text = tools[i].innerText.toLowerCase();
        tools[i].style.display = text.includes(input) ? "flex" : "none";
    }
}
</script>
</head>

<body>

<div class="sidebar">
    <h2>DevOps Tools</h2>

    <div class="search-box">
        <input type="text" id="searchInput" placeholder="Search tool..." onkeyup="searchTool()">
    </div>

    <div class="tool" onclick="loadTool('Linux', this)">🐧 Linux</div>
    <div class="tool" onclick="loadTool('Git', this)">🌿 Git</div>
    <div class="tool" onclick="loadTool('GitHub', this)">🐙 GitHub</div>
    <div class="tool" onclick="loadTool('Jenkins', this)">🤖 Jenkins</div>
    <div class="tool" onclick="loadTool('Docker', this)">🐳 Docker</div>
    <div class="tool" onclick="loadTool('Kubernetes', this)">☸️ Kubernetes</div>
    <div class="tool" onclick="loadTool('Ansible', this)">⚙️ Ansible</div>
    <div class="tool" onclick="loadTool('Helm', this)">⛵ Helm</div>
    <div class="tool" onclick="loadTool('AWS', this)">☁️ AWS</div>
    <div class="tool" onclick="loadTool('Grafana', this)">📊 Grafana</div>
    <div class="tool" onclick="loadTool('Prometheus', this)">🔥 Prometheus</div>
    <div class="tool" onclick="loadTool('ArgoCD', this)">🚀 ArgoCD</div>
    <div class="tool" onclick="loadTool('Chef', this)">👨‍🍳 Chef</div>
    <div class="tool" onclick="loadTool('Maven', this)">📦 Maven</div>
    <div class="tool" onclick="loadTool('SonarQube', this)">🔍 SonarQube</div>
    <div class="tool" onclick="loadTool('Nexus', this)">🏛️ Nexus</div>
    <div class="tool" onclick="loadTool('Terraform', this)">🌍 Terraform</div>
</div>

<div class="main">

    <div class="topbar">
        <h3>Welcome, <%= user %> 👋</h3>
        <a href="logout" class="logout-btn">Logout</a>
    </div>

    <div class="content">
    <div class="card">
        <h1 id="toolTitle">🚀 DevOps Dashboard</h1>
        <p id="toolDesc">
            Select a DevOps tool from the sidebar to view its details. 
            You can also search tools using the search box.
        </p>
    </div>


</div>

</body>
</html>
