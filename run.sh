#! /bin/bash

docker login -u lispavel https://index.docker.io/v1/

SHA=$(git rev-parse HEAD)
docker build -t lispavel/simpleweb:latest -t lispavel/simpleweb:$SHA .
docker push lispavel/simpleweb:latest
docker push lispavel/simpleweb:$SHA

kubectl apply -f server-namespace.yaml
kubectl config set-context --current --namespace=simpleweb

kubectl apply -f message-configmap.yaml
kubectl apply -f server-deployment.yaml
kubectl apply -f server-service.yaml

kubectl get deployments