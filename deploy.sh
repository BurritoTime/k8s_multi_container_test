docker build -t i11f2jz8e7/test-frontend-k8s:latest -t i11f2jz8e7/test-frontend-k8s:$GIT_SHA -f ./frontend/Dockerfile ./frontend
docker build -t i11f2jz8e7/test-backend-k8s:latest -t i11f2jz8e7/test-backend-k8s:$GIT_SHA -f ./backend/Dockerfile ./backend
docker build -t i11f2jz8e7/test-worker-k8s:latest -t i11f2jz8e7/test-worker-k8s:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push i11f2jz8e7/test-frontend-k8s:latest
docker push i11f2jz8e7/test-backend-k8s:latest
docker push i11f2jz8e7/test-worker-k8s:latest

docker push i11f2jz8e7/test-frontend-k8s:$GIT_SHA
docker push i11f2jz8e7/test-backend-k8s:$GIT_SHA
docker push i11f2jz8e7/test-worker-k8s:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployments/frontend-deployment frontend=i11f2jz8e7/test-frontend-k8s:$GIT_SHA
kubectl set image deployments/backend-deployment backend=i11f2jz8e7/test-backend-k8s:$GIT_SHA
kubectl set image deployments/worker-deployment worker=i11f2jz8e7/test-worker-k8s:$GIT_SHA