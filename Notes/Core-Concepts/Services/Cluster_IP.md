### Kubernetes Service

In a fullstack application when we have multiple layers of technology such as 
    Frontend -> Django
    Backend -> Go Lang
    Database -> Redis

Kubernetes provides a single interface to access the pods and redis database between different pods in a group

The services are directed to one of the pods under the group randomly

- Enables easy and effictive deployment of microservices based application

- Each layer can scale or move as required without impacting communication between the services

- Cluster IP -> Name for accessing the group of pods

> service-definition.yml

```yml
apiVersion: v1
kind: Service
metadata: 
    name: back-end
spec:
    type: ClusterIP
    ports: 
    - targetPort: 80
      port: 80
    selector:
        app: myapp
        type: back-end
```
```sh
> kubectl create -f service-definition.yml
> kubectl get services

```



