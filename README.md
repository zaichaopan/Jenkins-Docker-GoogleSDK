# Jenkins + Docker + Google Cloud SDK

This project is used to run a docker container which includes **Jenkins**, **Docker**(docker in docker `:sunglasses:`) and **Google Cloud SDK**.

To get it working

1. Maker sure your computer have docker installed

2. Clone the project

3. Inside the project's root directory, run the following command

```bash
. ./run-jenkins.sh
docker-jenkins-start
```

Wait unitl the container is running, the Jenkins server is hosted at **localhost:9090**.

4. Set up initial admin password

Jenkins will ask you for an initial admin password the first time your visit it. To get the password

```bash
docker exec -it jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
```

5.  Click **install recommended plugins**

Now you can start playing around with the Jenkins server. To see how to use it to do autmoate testing and deployment, click this [simple demo project](https://github.com/zaichaopan/vue-cli-jenkins-docker).





