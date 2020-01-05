docker build -t hasratsabit/multi-client:latest -t hasratsabit/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hasratsabit/multi-server:latest -t hasratsabit/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hasratsabit/multi-worker:latest -t hasratsabit/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hasratsabit/multi-client:latest
docker push hasratsabit/multi-server:latest
docker push hasratsabit/multi-worker:latest

docker push hasratsabit/multi-client:$SHA
docker push hasratsabit/multi-server:$SHA
docker push hasratsabit/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hasratsabit/multi-server:$SHA
kubectl set image deployments/client-deployment client=hasratsabit/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=hasratsabit/multi-worker:$SHA