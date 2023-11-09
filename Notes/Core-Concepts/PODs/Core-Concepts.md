# ETCD
    - Distributed, reliable Key value store that is simple, secure & fast
    - Used to store information about the k8s cluster
    - Operates on a distributed system --> If there are multiple master nodes there would be multiple ETCD services
    - Stores information on 
      - Nodes
      - Pods
      - Configs
      - Secrets
      - Accounts
      - Roles
      - Bindings
      - Others 
  
  Installation:

    1. `curl -L <Link_to_github_tar_gz_file>`
    2. Extract using `tar xzvf` command
    3. `./etcd`

CMD for Storing key-value:
  
  (v2)   
  ```sh
  ./etcdctl set key1 value1`
  ```

  (v3)
  ```sh
  ./etcdctl put key1 value1`
  ```

  Retrieve value (v2 and v3):
  ```sh
  ./etcdctl get key1
  ```

  List all keysstored in K8s:
  ```sh
    kubectl exec etcd-master -n kube-system etcdctl get / --prefix -key-only
  ```

!! Note `ETCDctl` version as the default would be set to 2.0
    `./etcdctl --version`

Set etcdctl version to 3:

`ETCDCTL_API=3 ./etcdctl version`

ETCDCTL version 2 supports the following commands:
```
etcdctl backup
etcdctl cluster-health
etcdctl mk
etcdctl mkdir
etcdctl set
```

Whereas the commands are different in version 3
```
etcdctl snapshot save 
etcdctl endpoint health
etcdctl get
etcdctl put
```
## To get pods in the Cluster:

```sh
kubectl get pods -n kube-system
```

# Kube-API server
 - Kube API Server is main source of entry/communication between the K8s process and User
 - Responsible for authenticating, validating requests retrieving and updating data in the etcd data store
 - Kube API server is the only service that acts directly with ETCD
 - Scheduler, kube-controller manager and kubelet uses the API-server to perform updates in the cluster to respective areas
Installation:

    - wget <Link_to_storage.googleapis_kube-apiserver>
CMD:
```
cat /etc/systemd/system/kube-apiserver.service      # api-server option
cat /etc/kubernetes/manifests/kube-apiserver.yaml   # Kube-apiserver service
ps -aux | grep kube-apiserver                       # view the running process

```
# Kube Controller Manager
- Continuously monitor the state of various components within the system and works towards bringing the whole system to the desired functioning state
- Node Controller: Responsible for monitoring the status of the nodes and takes necessary action to keep the application running thru Kube API server
    - Tests status of the nodes every 5 second (by default); If there is no heartbeat found then the nodes is labelled unreachable and additional nodes are spin up
    - Waits for 40 seconds before labelling the node as unreachable; Gives 5 min for the node to come back up; If the node is still not up then reprovisions the pod to healthy nodes
- Replication Controller
    - Responsible for monitoring status of replica sets and ensuring desired number of PODs are available at all times within the set
    - If a pod dies then creates another one
  
CMD:
View kube-controller-manager options:
```sh
cat /etc/kubernetes/manifests/kube-controller-manager.yaml  # KubeAdm
cat /etc/systemd/system/kube-controller-manager.service     # non-KubeAdm Setup
ps -aux | grep kube-controller-manager                      # check running controller manager process
```

# Kube Scheduler

- Responsible for only deciding/scheduling which pod goes on which node; Doesn't actually place the pod on the nodes
- Scheduler decides which nodes the pods are placed on depending on certain criteria (i.e vCPU, memory space, Process availability)
- Scheduler assigns the pods based on calculation of set of CPU and memory requirements based on priority function to place the pod into the respective VM
    1. Filter nodes
    2. Rank nodes
- Own scheduler can be written for the pods replica
CMD:
```sh
cat /etc/kubernetes/manifests/kube-scheduler.yaml   # kubeADM
cat /etc/systemd/system/kube-scheduler.service      # non-kubeAdm
ps -aux | grep kube-scheduler                       # check running kube-scheduler process
```

# Kubelet
    - Like captain of the ship; Leads all activities on node
    - Does the paperwork needed to become part of the cluster; Registers the node with kubernetes Cluster
    - Sole point of contact from the Kube API-server
    - Creates PODs
    - Load or unload containers into the ship as instructed by the scheduler
    - Send back reports in regular intervals on the status of the ship and containers on them
  CMD:  
    `wget <link to kubelet install from storage.googleapis>`
    `kubelet.service`
    To view running Kubelet:
        `ps -aux | grep kubelet`
    * !! Kubeadm doesnt deploy kubletes; must manually install kubelet on worker nodes
# Kube proxy
    Pod network info
    - Within a K8s Cluster, every pod can reach other pods through pod networking solution
    - Pod network is a internal virtual network that spans to all nodes in cluster which all pods can connect to
    - Every Service can be configured a name<DB> in the pod network for other microservice to be able to reach them
    - Pod network is not a service but rather a virtual component that lives in the K8s memory
  
  Kube Proxy is a process that runs on each node in the k8s cluster
    - Its job is to look for new services, and every time a new service is created 
      - it creates appropriate rules for each node to forward traffic to those services to the backend pods
    - Uses IPtable rules; creates a rule for each node to forward traffic heading to the IP of the service: Ex 10.96.0.12 --> 10.32.0.15
    
  CMD:  
    `wget <link to kube-proxy install from storage.googleapis>`
    `kube-proxy.service`

    To see kube-proxy service running:
      ```sh
          kubectl get pods -n kube-system | grep kube-proxy
      ```
    
    To see daemonset:
        ```sh
            kubectl get daemonset -n kube-system
        ```
    *  Kubeadm deploys kube-proxy as pods on each node
  
### To view pods (after configuration from YML):

    ```sh
        kubectl get pods
        kubectl describe pod myapp-pod
    ```



    

