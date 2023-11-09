### 1. How many pods are there in the default namespace?

```sh 
kubectl get pods --namespace default
```

### 2. Create a new pod with the nginx image

```sh 
kubectl create deployment nginx --image=nginx
```


### 3. How many pods have we created?

```sh 
kubectl get pods
```

### 4. What is the image used to create the new pods?
* Get all images running in the cluster

* All images running in the default namespace *
```sh
kubectl get pods --namespace default --output=custom-columns="NAME:.metadata.name,IMAGE:.spec.containers[*].image"
```

### 5. Which nodes are these pods placed on?

```sh 
kubectl get pods -o wide
```

### 6. How many containers are part of the pod `webapp`? && What images are used in the new `webapp` pod?

```sh 
kubectl get pod webapp -o jsonpath='{.spec.containers[*].name}'
```

### 8. What is the state of the container agentx in the pod webapp?

```
kubectl describe pod webapp
```

### 9. Delete the webapp Pod.

```
kubectl delete pod webapp --now 
```