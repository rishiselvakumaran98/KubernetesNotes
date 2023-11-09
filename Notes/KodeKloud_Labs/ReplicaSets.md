### 1. How many PODs exist on the system? In the current(default) namespace.

```
> kubectl get pods --namespace=default
```

### 2. How many ReplicaSets exist on the system? In the current(default) namespace.

```
> kubectl get replicaset --namespace=default
```

### 4. How many PODs are DESIRED in the `new-replica-set`?

```
> kubectl describe replicaset new-replica-set
```

### 5. What is the image used to create the pods in the new-replica-set?

```
> kubectl describe replicaset new-replica-set
```

### 6. How many PODs are READY in the new-replica-set?

```
> kubectl describe replicaset new-replica-set
```

### 7. Why do you think the PODs are not ready?
* Find a pod created by the replicaset and inspect it
```
> kubectl describe pod new-replica-set-djx78
```

### 8. Delete any one of the 4 PODs.

```
> kubectl delete pod new-replica-set-djx78 --now
```

### 9. How many PODs exist now?

```
> kubectl get pods
```

### 10. Why does the number of pods still remain the same?

```
> Replicaset ensures the same number of pods are always running
```

### replicaset-definition-1.yml
```yml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx

  replicas: 2
  selector:
    matchLabels:
      tier: frontend
```

### replicaset-definition-2.yml
```yml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-2
spec:
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx

  replicas: 2
  selector:
    matchLabels:
      tier: frontend
```

### 13. Delete replicasets 
```
kubectl delete replicaset replicaset-1
```

### 14. Fix the original replica set new-replica-set to use the correct busybox image.
   ```sh
   > kubectl get replicaset new-replica-set -o yaml >> new-replicaset.yaml
   ```
   OR,
   ```
   > kubectl edit replicaset new-replica-set
   ```
   - In the yaml file change the `Image: busybox`

  ```sh
  > kubectl delete replicaset new-replica-set
  ```

  ```sh
  > kubectl create -f new-replicaset.yaml
  ```

### 15. Scale the ReplicaSet to 5 PODs.

```
> kubectl scale --replicas=5 replicaset new-replica-set
```

### 16. Now scale the ReplicaSet down to 2 PODs.

```
> kubectl scale --replicas=2 replicaset new-replica-set
```