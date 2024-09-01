# Bitbucket Pipelines Configuration for AWS CodeDeploy

This repository contains a `bitbucket-pipelines.yml` file which is used to configure Bitbucket Pipelines for Continuous Integration/Continuous Deployment (CI/CD) with AWS CodeDeploy.

## Overview

The pipeline is configured to run on a Docker image with Node.js version 18. It defines three steps: Linting, Deployment to Stage, and Deployment to Production.

### Lint Step

This step is a placeholder for a linting script. You should replace `echo "Your linting goes here..."` with your actual linting command.

### Deployment to Stage Step

This step is executed when code is pushed to the `stage` branch. It performs the following actions:

- Updates the package list for the Linux distribution
- Installs the `zip` package
- Copies the `appspec-stage.yml` file to `appspec.yml`
- Creates a zip file of the application
- Uploads the zip file to an S3 bucket using the `atlassian/aws-code-deploy:0.2.5` pipe
- Deploys the application to the staging environment using the `atlassian/aws-code-deploy:0.2.5` pipe

### Deployment to Production Step

This step is executed when code is pushed to the `master` branch. It performs the same actions as the Deployment to Stage step, but uses the `appspec-prod.yml` file and deploys to the production environment.

## Environment Variables

The pipeline requires several environment variables to be set in the Bitbucket repository settings. These include:

- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `APPLICATION_NAME`
- `S3_BUCKET`
- `STAGE_DEPLOYMENT_GROUP`
- `PROD_DEPLOYMENT_GROUP`

## AWS CodeDeploy Configuration

The pipeline uses AWS CodeDeploy to deploy the application. The `appspec-stage.yml` and `appspec-prod.yml` files contain the instructions for AWS CodeDeploy on how to deploy the application. These files should be created in the root of your repository.

## Usage

To use this pipeline, you need to:

1. Replace the placeholder linting command with your actual linting command.
2. Create `appspec-stage.yml` and `appspec-prod.yml` files in the root of your repository.
3. Set the required environment variables in the Bitbucket repository settings.
4. Push code to the `stage` or `master` branch to trigger the pipeline.
