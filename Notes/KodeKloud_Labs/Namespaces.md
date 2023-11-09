# Namespaces Lab

## 1. How many Namespaces exist on the system?

```sh
> kubectl get namespaces 
```

Or

```sh
> kubectl get ns 
```

## 2. How many pods exist in the research namespace?

```sh
> kubectl get pods --namespace=research
```

## 3. Create a POD in the finance namespace

### Use the spec given below

Name: redis
Image Name: redis

```sh
> kubectl run redis --image=redis --namespace=finance
```

## 4. Which namespace has the blue pod in it?

```sh
> kubectl get pods --all-namespaces | grep blue
```

## 5. What DNS name should the Blue application use to access the database db-service in its own namespace?

You can try it in the web application UI. Use port 6379.

`
db-service
`

## 6. What DNS name should the Blue application use to access the database db-service in the dev namespace?

You can try it in the web application UI. Use port 6379.

`
db-service.dev.svc.cluster.local
`
