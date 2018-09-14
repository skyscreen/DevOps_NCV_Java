kubectl taint nodes --all node-role.kubernetes.io/master-
# check that it is working
kubectl get all --namespace=kube-system
kubectl get all --namespace=kube-system -o wide
