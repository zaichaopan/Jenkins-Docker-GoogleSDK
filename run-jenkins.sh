alias docker-jenkins-start="docker-compose -f docker-compose.yml up"
alias docker-jenkins-stop="docker stop jenkins && docker rm $(docker ps -aq) && docker volume prune -f"