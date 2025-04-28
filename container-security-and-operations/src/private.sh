docker login
docker build -t j93es/19_minsukjung .
docker push j93es/19_minsukjung
kubectl create secret docker-registry my-dockerhub-secret \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=USERNAME \
  --docker-password=PASSWORD \
  --docker-email=EMAIL
kubectl apply -f pod-private.yaml
kubectl get pod
kubectl port-forward pod/express-app-private 8080:3000 
kubectl logs express-app-private