This is for k8 deploy

#Just run by maven
mvn clean install


#Run for docker
#since image update, suggest use Dockerfile4app 

docker build .

docker run -ti -p 8090:8080 [image_id] bash

/tmp/servlet/start.sh

#http access in local

http://localhost:8090/ServletTest-1/hello


#Run by Dockerfile4app

docker build -f Dockerfile4app .

