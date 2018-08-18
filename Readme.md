

Deploy java project docker on nomad consul vault on standalone on Linux VM and Mac 


v1.0/v1.1 
Deploy docker on nomad and consul

#if only use java servlet maven project:
mvn clean install

#For docker run
docker build .
docker run -ti -p 8090:8080 [image_id] bash
/tmp/servlet/start.sh

#Build by Dockerfile4app for app image use directly
docker build -f Dockerfile4app .

#verify http access in local
http://localhost:8090/ServletTest-1/hello


v1.2
Deploy to vault and use consul-template to access vault and consul kv

Before deploy
1) setup vault (init,unseal,create policy for new path,gen token, create kv for new path
2) set consul kv, value save vault token
3) run nomad job

Please see details in mac or linux folder desc.












