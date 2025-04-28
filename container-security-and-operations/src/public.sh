docker login
docker build -t j93es/19_minsukjung .
docker push j93es/19_minsukjung
kubectl apply -f pod.yaml
kubectl get pod
kubectl port-forward pod/express-app 8080:3000 
kubectl logs express-app  
