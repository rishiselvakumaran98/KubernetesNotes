#! bin/sh

# Create a ReplicaSet
kubectl create -f replicaset-definition.yml
kubectl get replicaset
kubectl get pods
kubectl describe replicaset myapp-replicaset
kubectl delete replicaset myapp-replicaset
kubectl replace -f replicaset-definition.yml
kubectl scale --replicas=6 -f replicaset-definition.yml # force scale up
kubectl scale --replicas=6 replicaset myapp-replicaset