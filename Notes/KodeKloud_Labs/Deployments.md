### 5. How many ReplicaSets exist on the system now?
```sh
> kubectl get replicasets
```
### 6. How many pods exist in the system now? && Out of how many pods are ready now?

```sh
> kubectl get pods
```

### 8. What is the image used to create the pods in the new deployment?
```sh
> kubectl describe replicaset frontend-deployment-7fbf4f5cd9
```


### 9. Why do you think the deployment is not ready?
```sh
> kubectl describe pod frontend-deployment-7fbf4f5cd9-46zx8
```
### 10. Edit the deployment-definition-1.yaml file

```yml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-1
spec:
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - name: busybox-container
        image: busybox888
        command:
        - sh
        - "-c"
        - echo Hello Kubernetes! && sleep 3600

  replicas: 2
  selector:
    matchLabels:
      name: busybox-pod
```

### Create a new Deployment with the below attributes using your own deployment definition file.

> Name: `httpd-frontend`;

> Replicas: `3`;

> Image: `httpd:2.4-alpine`

Shortcut CMD:
```sh
> kubectl create deployment httpd-frontend --image=httpd:2.4-alpine --replicas=3
```

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-frontend
  labels:
    app: myapp
    type: front-end
spec:
  template:
    metadata:
      labels:
        app: myapp
        type: front-end
    spec:
      containers:
      - name: webserver
        image: httpd:2.4-alpine
  replicas: 3
  selector:
    matchLabels:
      type: front-end
```

CMD:
```sh
> kubectl create -f deployment-definition-2.yml
> kubectl get deployments
```
