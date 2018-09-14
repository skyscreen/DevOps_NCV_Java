value=`kubectl get pods |grep k8app |awk '{print $3}'`

while [ $value != "Running" ]
do
  echo $value
  sleep 5
  value=`kubectl get pods |grep k8app |awk '{print $3}'`
done
kubectl port-forward k8app 8090:8080
