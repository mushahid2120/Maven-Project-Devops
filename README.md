# Java Maven DevOps Project

![] (project-design.jpg)

This repository contains a Java-based application managed with Maven, featuring an automated CI/CD pipeline using Jenkins. The project includes security scans, artifact deployment, and containerization for streamlined development and deployment.

---

    Maven-Project-Devops/
    ├── src/                    # Source code directory
    ├── pom.xml                # Maven build configuration
    ├── Dockerfile             # Dockerfile for containerization
    ├── Jenkinsfile            # Jenkins pipeline for CI/CD
    ├── target/                # Compiled binaries and packaged artifacts
    ├── README.md              # Project documentation

## Features

- **Maven Build**: Automates dependency management and project build.
- **Static Code Analysis**: Uses SonarQube for code quality checks.
- **Security Scanning**: Integrates OWASP Dependency Check and Trivy for vulnerability detection.
- **Artifact Deployment**: Pushes the compiled package to an artifact repository.
- **Containerization**: Builds a Docker image for easy deployment.
- **CI/CD Pipeline**: Jenkins automates the entire process from code commit to deployment.

## Prerequisites

- **Java (JDK 17+)**: Required for compiling the project.
- **Maven**: For building and managing dependencies.
- **Docker**: For containerizing the application.
- **Jenkins**: Configured with required plugins.
- **SonarQube**: For code analysis.
- **Trivy & OWASP Dependency Check**: For security scans.

## How to Run the Project

### Step 1: Clone the Repository
```bash
    git clone https://github.com/mushahid2120/Maven-Project-Devops.git
    cd Maven-Project-Devops
```

### Step 2: Build the Project with Maven
```bash
    mvn clean package
```

### Step 3: Run the Application Locally
```bash
    java -jar target/*.jar
```

### Step 4: Build and Run with Docker

#### Build Docker Image
```bash
    docker build -t mushahid144/java-maven:v1 .
```

#### Run Container
```bash
    docker run -dit -p 80:8080 --name myjavaapp mushahid144/java-maven:v1
```

## Jenkins Pipeline

A Jenkins pipeline automates the build, security scanning, artifact deployment, and containerization.

#### Stages in Jenkins Pipeline:
1. **Git Checkout** - Pulls the latest code from the repository.
2. **Compile** - Builds the project using Maven.
3. **OWASP Dependency Check** - Scans for security vulnerabilities.
4. **SonarQube Analysis** - Performs static code analysis.
5. **Push Artifact** - Deploys the compiled package to an artifact repository.
6. **Docker Build** - Creates a Docker image.
7. **Trivy Security Scan** - Scans the Docker image for vulnerabilities.
8. **Docker Push** - Pushes the image to a container registry.
9. **Docker Run** - Runs the containerized application.

## Future Enhancements

- Implement CI/CD with **ArgoCD** for GitOps workflow.
- Use **Kubernetes** for scalable deployments.
- Automate infrastructure provisioning with **Terraform**.
- Enhance security with **SAST/DAST** tools.

---
