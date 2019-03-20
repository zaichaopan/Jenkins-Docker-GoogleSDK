# Vue cli, Jenkins, Docker, Google Cloud SDK

## Jenkins setup

Clone project [Jenkins-Docker-GoogleSDK](https://github.com/zaichaopan/Jenkins-Docker-GoogleSDK). Follow the project's README to start Jenkins server.

## Jenkins pipeline

To create a pipeline for your project, in your jenkins server, click new item and select pipeline.  After creating, click configure and enter your proejct Repository URL and credential

The project's pipeline is defined in **jenkensfile**. In the deploy stage, it will push the new created image to **google cloud** and deploy to the **app enginer**. 

To make it work, in your google develope console

1. Create a new project

2. Click Api & services dropdown, select credentials, then select service account, then select Compute Engine default service account to generate a json key file.

3. Navigate to [your google project app enginer api page](https://console.developers.google.com/apis/api/appengine.googleapis.com/) to enable app engine api

4. After downloading the file, in jenkins credential page, add a new new credential (select secret file and using the json key file downloaded).

5. Get the new credential id, use it for the credentialsId value in jenkinsfile

## Create a new build

Click build button in the new created jenkins project. Click **Console Output** for more information is the build fails. 


