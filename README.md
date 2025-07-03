docker-react-EB-aws deployment

A production focused React application deployed using Docker, Docker Compose, and Kubernetes, with full AWS Elastic Beanstalk integration.
Overview

This repository demonstrates how to containerize a React application and deploy it to AWS using modern DevOps workflows. It covers local development with Docker, secure environment management, and automated deployment via GitHub Actions to AWS Elastic Beanstalk.
Features

    Dockerized React app for consistent local and production environments

    Docker Compose for multi-container orchestration

    Kubernetes-ready configuration (optional)

    AWS Elastic Beanstalk deployment with IAM best practices

    Secure secrets management using GitHub Secrets

    CI/CD integration for automated deployments

Prerequisites

    Docker and Docker Compose installed

    AWS account with necessary permissions

    GitHub repository with Actions enabled

Local Development

    Clone the repository:

bash
git clone https://github.com/your-username/docker-react.git
cd docker-react

Build the Docker image:

bash
docker build -t react-application .

Run the application:

bash
docker run -d -p 3000:3000 react-application

Visit http://localhost:3000 to view the app

.

Using Docker Compose (optional):

    bash
    docker compose up -d

AWS Deployment Instructions
1. IAM and Elastic Beanstalk Setup

    Create an IAM Role with Elastic Beanstalk access.

    In the AWS Management Console, create a new Elastic Beanstalk application.

        Select the Docker platform (64bit Amazon Linux 2).

    Create a service role named aws-EB-service-role and assign it to your EB environment.

2. S3 Bucket Configuration

    Locate your Elastic Beanstalk S3 bucket.

    Go to Permissions → Object Ownership → Edit.

    Enable ACLs and set Bucket owner preferred to Object Writer.

    Save changes.

3. GitHub Secrets

    Enable GitHub Secrets for secure storage of AWS credentials.

    In AWS, create an IAM user with programmatic access and attach policies for Elastic Beanstalk.

    Generate access keys and add them as secrets in your GitHub repository:

        AWS_ACCESS_KEY_ID

        AWS_SECRET_ACCESS_KEY

4. Deployment Workflow

    Push code changes to a feature branch.

    Create a Pull Request (PR).

    GitHub Actions will build and deploy the application to Elastic Beanstalk automatically upon PR merge.

Security Best Practices

    Environment Variables: Store sensitive data in .env files and ensure they are listed in .gitignore and .dockerignore


Docker Secrets: For production, consider using Docker Secrets or AWS Secrets Manager for confidential data
