mvn clean install


For docker

docker build .
docker run -ti -p 8090:8080 [image_id] bash
/tmp/servlet/start.sh

http access in local
http://localhost:8090/ServletTest-1/hello


Run Dockerfile4app

docker build -f Dockerfile4app .

