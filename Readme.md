# This is for k8s deploy

## setup cluster in standalone 
please refer https://github.crookster.org/Kubernetes-Ubuntu-18.04-Bare-Metal-Single-Host/

## run yml
kubectl create -f k8app.yml


## verify
kubectl describe pod k8app    | grep IP:
curl http://<IP>:8080





