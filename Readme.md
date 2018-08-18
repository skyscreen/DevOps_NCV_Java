

# Deploy java project docker on nomad consul vault on standalone on Linux VM and Mac 


## v1.0/v1.1   
Deploy docker on nomad and consul

==if only use java servlet maven project:  
mvn clean install  <br>

#For docker run 
<br>docker build .  
<br>
docker run -ti -p 8090:8080 [image_id] bash
<br>
/tmp/servlet/start.sh
<br>
#Build by Dockerfile4app for app image use directly
<br>
docker build -f Dockerfile4app .
<br>
#verify http access in local
<br>
http://localhost:8090/ServletTest-1/hello
<br>
<br>
<br>
<br>
## v1.2
<br>
Deploy to vault and use consul-template to access vault and consul kv
<br>
Before deploy
<br>
<br>
1) setup vault (init,unseal,create policy for new path,gen token, create kv for new path
<br>
2) set consul kv, value save vault token
<br>
3) run nomad job
<br>
Please see details in mac or linux folder desc.
<br>












