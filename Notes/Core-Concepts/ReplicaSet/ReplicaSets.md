## Why replication is important?

- If one of the pods running in the node crashes, replication prevents users from losing access to application 

### Replication controller helps us run multiple instance of a single pod in the kubernetes cluster

    ++ Provides high availability

      - Even if you have single pod the replication controller can help by automatically bringing up a new pod when the existing one fails
      - Ensures specified number of pods are running at all times

    ++ Load Balancing and scaling
      -  Create multiple pods to share the load across them
      -  When the number of users increase we deploy additional pods to balance the load across the two pods when demand increases
  

### Replication Controller vs Replica Set
    - Replication controller is the older tech replaced by ReplicaSet
    - Replica Set requires a selector section to identify what pods fall under it
    - ReplicaSet can also manage pods that were not create as part of the Replica Set creation
    - we can use ReplicaSet to manage/monitor existing pods that have already been created
    - Labelling our pods helps the ReplicaSet distinguish which pods to monitor/manage (Acts as a filter)
  
!!When we create a replica for existing pods its not going to create three more pods, however,

!! we still need to provide template as if one of the pods fail, the replicaset can spin additional pods to maintain 3 all the times

### How to replace the existing number of replicas??

  - Change the replicas no in the definition.yml file
  - Then run: `kubectl replace -f replicaset-definition.yml`
  - Or run: `kubectl scale --replicas=6 <Type> <name>`
  - Ex: `kubectl scale --replicas=6 replicaset myapp-replicaset`

Commands:
  ```sh
  > kubectl create -f replicaset-definition.yml
  > kubectl get replicaset
  > kubectl delete replicaset myapp-replicaset
  > kubectl replace -f replicaset-definition.yml
  ```
