docker build -t ganeshprabh07/multi-client:latest -t ganeshprabh07/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ganeshprabh07/multi-server:latest -t ganeshprabh07/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ganeshprabh07/multi-worker:latest -t ganeshprabh07/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push ganeshprabh07/multi-client:latest
docker push ganeshprabh07/multi-server:latest
docker push ganeshprabh07/multi-worker:latest
docker push  ganeshprabh07/multi-client:$SHA
docker push ganeshprabh07/multi-server:$SHA
docker push ganeshprabh07/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ganeshprabh07/multi-server:$SHA
kubectl set image deployments/client-deployment client=ganeshprabh07/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=ganeshprabh07/multi-worker:$SHA