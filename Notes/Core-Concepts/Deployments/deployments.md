### Why Deployment:
	- Setting up Microservices for rolling software updates such that if there is any error in upgrade of one microservice we can roll back changes to the previous version quickly without reducing downtime for consumers

	- We might not want to apply each change immediately after each command and instead would like to pause the environment and then apply changes and then resume service


### Deployment

- Provides us with the capability to upgrade the underlying instances seamlessly using rolling updates, undo changes, pause and resume changes


> Sample deployment-definition.yml file:
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment 
  labels: 
    app: myapp
    type: front-end
spec: 
  template:
    metadata:
      name: myapp-pod
      labels:
        app: myapp
        type: front-end
    spec:
      containers: 
      - name: nginx-container
        image: nginx
  replicas: 3
  selector:
    matchLabels:
      type: front-end
```
* Everything is same except the kind --> `Deployment`

CMD:

> !! If you want to get all info then just run
```sh
> kubectl get all
```

```sh
  > kubectl create -f deployment-definition.yml
  > kubectl get deployments
  > kubectl get replicaset
  > kubectl get pods
```