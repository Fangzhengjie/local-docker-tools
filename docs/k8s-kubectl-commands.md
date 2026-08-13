# Kubernetes kubectl Command Reference

## Basic Commands

### Cluster Information
```bash
# View cluster information
kubectl cluster-info

# List cluster nodes
kubectl get nodes

# Describe node details
kubectl describe node <node-name>

# Check kubectl version
kubectl version
```

## Resource Query Commands (Get)

### Pods
```bash
# List all pods
kubectl get pods

# List pods in all namespaces
kubectl get pods --all-namespaces
kubectl get pods -A

# List pods in specific namespace
kubectl get pods -n <namespace>

# List pods with detailed information
kubectl get pods -o wide

# Get pod YAML configuration
kubectl get pod <pod-name> -o yaml

# Get pod JSON configuration
kubectl get pod <pod-name> -o json

# Watch pod status continuously
kubectl get pods -w
```

### Deployments
```bash
# List all deployments
kubectl get deployments
kubectl get deploy

# List deployments in all namespaces
kubectl get deployments -A

# List deployments in specific namespace
kubectl get deployments -n <namespace>

# List deployments with detailed information
kubectl get deployments -o wide

# Get deployment YAML configuration
kubectl get deployment <deployment-name> -o yaml
```

### Services
```bash
# List all services
kubectl get services
kubectl get svc

# List services in all namespaces
kubectl get services -A

# List services in specific namespace
kubectl get services -n <namespace>

# List services with detailed information
kubectl get services -o wide
```

### ConfigMaps
```bash
# List all configmaps
kubectl get configmaps
kubectl get cm

# List configmaps in all namespaces
kubectl get configmaps -A

# List configmaps in specific namespace
kubectl get configmaps -n <namespace>

# Get configmap details
kubectl get configmap <configmap-name> -o yaml
```

### Secrets
```bash
# List all secrets
kubectl get secrets

# List secrets in all namespaces
kubectl get secrets -A

# List secrets in specific namespace
kubectl get secrets -n <namespace>

# Get secret details
kubectl get secret <secret-name> -o yaml

# Decode secret content
kubectl get secret <secret-name> -o jsonpath='{.data.password}' | base64 --decode
```

### Namespaces
```bash
# List all namespaces
kubectl get namespaces
kubectl get ns

# Describe namespace details
kubectl describe namespace <namespace-name>
```

### Ingress
```bash
# List all ingress resources
kubectl get ingress
kubectl get ing

# List ingress in all namespaces
kubectl get ingress -A

# List ingress in specific namespace
kubectl get ingress -n <namespace>

# Describe ingress details
kubectl describe ingress <ingress-name>
```

### PersistentVolumes and PersistentVolumeClaims
```bash
# List all persistent volumes
kubectl get persistentvolumes
kubectl get pv

# List all persistent volume claims
kubectl get persistentvolumeclaims
kubectl get pvc

# List PVCs in specific namespace
kubectl get pvc -n <namespace>
```

### StatefulSets
```bash
# List all statefulsets
kubectl get statefulsets
kubectl get sts

# List statefulsets in all namespaces
kubectl get statefulsets -A

# List statefulsets in specific namespace
kubectl get statefulsets -n <namespace>
```

### DaemonSets
```bash
# List all daemonsets
kubectl get daemonsets
kubectl get ds

# List daemonsets in all namespaces
kubectl get daemonsets -A

# List daemonsets in specific namespace
kubectl get daemonsets -n <namespace>
```

### Jobs and CronJobs
```bash
# List all jobs
kubectl get jobs

# List all cronjobs
kubectl get cronjobs
kubectl get cj

# List jobs in specific namespace
kubectl get jobs -n <namespace>
```

### EnvoyFilter (Istio)
```bash
# List all envoyfilters
kubectl get envoyfilters

# List envoyfilters in all namespaces
kubectl get envoyfilters -A

# List envoyfilters in specific namespace
kubectl get envoyfilters -n <namespace>

# Get envoyfilter configuration
kubectl get envoyfilter <envoyfilter-name> -o yaml
```

### VirtualService and DestinationRule (Istio)
```bash
# List all virtualservices
kubectl get virtualservices
kubectl get vs

# List all destinationrules
kubectl get destinationrules
kubectl get dr

# List virtualservices in all namespaces
kubectl get virtualservices -A

# List destinationrules in all namespaces
kubectl get destinationrules -A
```

### Gateway (Istio)
```bash
# List all gateways
kubectl get gateways
kubectl get gw

# List gateways in all namespaces
kubectl get gateways -A

# Get gateway configuration
kubectl get gateway <gateway-name> -o yaml
```

## Resource Details (Describe)

```bash
# Describe pod details
kubectl describe pod <pod-name>
kubectl describe pod <pod-name> -n <namespace>

# Describe deployment details
kubectl describe deployment <deployment-name>

# Describe service details
kubectl describe service <service-name>

# Describe node details
kubectl describe node <node-name>

# Describe secret details
kubectl describe secret <secret-name>
```

## Logs

```bash
# View pod logs
kubectl logs <pod-name>

# View logs from specific container (multi-container pod)
kubectl logs <pod-name> -c <container-name>

# Stream logs in real-time
kubectl logs -f <pod-name>

# View last 100 lines of logs
kubectl logs --tail=100 <pod-name>

# View logs from last 1 hour
kubectl logs --since=1h <pod-name>

# View logs from previous crashed container
kubectl logs <pod-name> --previous

# View logs from all containers
kubectl logs <pod-name> --all-containers=true
```

## Execute Commands (Exec)

```bash
# Execute command in pod
kubectl exec <pod-name> -- <command>

# Get interactive shell in pod
kubectl exec -it <pod-name> -- /bin/bash
kubectl exec -it <pod-name> -- /bin/sh

# Execute command in specific container (multi-container pod)
kubectl exec -it <pod-name> -c <container-name> -- /bin/bash

# Execute command in pod in specific namespace
kubectl exec -it <pod-name> -n <namespace> -- /bin/bash
```

## Port Forwarding

```bash
# Forward local port to pod
kubectl port-forward <pod-name> <local-port>:<pod-port>

# Example: Forward local 8080 to pod port 80
kubectl port-forward <pod-name> 8080:80

# Forward to service
kubectl port-forward service/<service-name> <local-port>:<service-port>

# Forward to deployment
kubectl port-forward deployment/<deployment-name> <local-port>:<pod-port>
```

## Create and Apply Resources

```bash
# Create resource from file
kubectl create -f <file.yaml>

# Apply resource from file (create or update)
kubectl apply -f <file.yaml>

# Apply all resources from directory
kubectl apply -f <directory>/

# Apply resource from URL
kubectl apply -f https://example.com/resource.yaml

# Create namespace
kubectl create namespace <namespace-name>

# Create deployment from command line
kubectl create deployment <deployment-name> --image=<image-name>

# Create secret
kubectl create secret generic <secret-name> --from-literal=key=value

# Create configmap from file
kubectl create configmap <configmap-name> --from-file=<file-path>
```

## Update Resources (Edit/Patch/Set)

```bash
# Edit resource
kubectl edit <resource-type> <resource-name>

# Example: Edit deployment
kubectl edit deployment <deployment-name>

# Update image
kubectl set image deployment/<deployment-name> <container-name>=<new-image>

# Scale deployment
kubectl scale deployment <deployment-name> --replicas=<number>

# Autoscale deployment
kubectl autoscale deployment <deployment-name> --min=<min> --max=<max> --cpu-percent=<percent>

# Patch resource
kubectl patch deployment <deployment-name> -p '{"spec":{"replicas":3}}'
```

## Delete Resources

```bash
# Delete pod
kubectl delete pod <pod-name>

# Delete deployment
kubectl delete deployment <deployment-name>

# Delete service
kubectl delete service <service-name>

# Delete resource from file
kubectl delete -f <file.yaml>

# Delete namespace (deletes all resources in namespace)
kubectl delete namespace <namespace-name>

# Force delete pod
kubectl delete pod <pod-name> --force --grace-period=0

# Delete all pods
kubectl delete pods --all

# Delete resources by label
kubectl delete pods -l <label-key>=<label-value>
```

## Labels and Annotations

```bash
# Show resource labels
kubectl get pods --show-labels

# Add label
kubectl label pod <pod-name> <label-key>=<label-value>

# Update label
kubectl label pod <pod-name> <label-key>=<new-value> --overwrite

# Remove label
kubectl label pod <pod-name> <label-key>-

# Filter resources by label
kubectl get pods -l <label-key>=<label-value>

# Add annotation
kubectl annotate pod <pod-name> <annotation-key>=<annotation-value>
```

## Rollout

```bash
# View deployment rollout history
kubectl rollout history deployment/<deployment-name>

# View specific revision details
kubectl rollout history deployment/<deployment-name> --revision=<revision-number>

# Rollback to previous version
kubectl rollout undo deployment/<deployment-name>

# Rollback to specific revision
kubectl rollout undo deployment/<deployment-name> --to-revision=<revision-number>

# Check rollout status
kubectl rollout status deployment/<deployment-name>

# Pause rollout
kubectl rollout pause deployment/<deployment-name>

# Resume rollout
kubectl rollout resume deployment/<deployment-name>

# Restart deployment (recreate all pods)
kubectl rollout restart deployment/<deployment-name>
```

## Resource Usage (Top)

```bash
# View node resource usage
kubectl top nodes

# View pod resource usage
kubectl top pods

# View pod resource usage in specific namespace
kubectl top pods -n <namespace>

# View pod resource usage in all namespaces
kubectl top pods -A

# View container resource usage in pod
kubectl top pod <pod-name> --containers
```

## Context and Configuration

```bash
# View current context
kubectl config current-context

# List all contexts
kubectl config get-contexts

# Switch context
kubectl config use-context <context-name>

# Set default namespace
kubectl config set-context --current --namespace=<namespace-name>

# View configuration
kubectl config view

# View merged configuration
kubectl config view --merge
```

## Debugging and Troubleshooting

```bash
# Run temporary debug pod
kubectl run debug-pod --image=busybox --rm -it -- /bin/sh

# Create debug container (Kubernetes 1.23+)
kubectl debug <pod-name> -it --image=busybox

# Copy pod for debugging
kubectl debug <pod-name> -it --copy-to=<new-pod-name> --container=<container-name>

# View events
kubectl get events
kubectl get events --sort-by=.metadata.creationTimestamp

# View events in specific namespace
kubectl get events -n <namespace>

# List API resources
kubectl api-resources

# List API versions
kubectl api-versions

# Explain resource fields
kubectl explain pod
kubectl explain pod.spec
kubectl explain pod.spec.containers
```

## Advanced Queries

```bash
# Query using JSONPath
kubectl get pods -o jsonpath='{.items[*].metadata.name}'

# Query specific fields
kubectl get pods -o custom-columns=NAME:.metadata.name,STATUS:.status.phase

# Sort results
kubectl get pods --sort-by=.metadata.creationTimestamp

# Query multiple resource types
kubectl get pods,services,deployments

# Use field selector
kubectl get pods --field-selector status.phase=Running

# Combine label selectors
kubectl get pods -l 'environment in (production,staging)'
```

## Other Common Commands

```bash
# Validate YAML file syntax
kubectl apply --dry-run=client -f <file.yaml>

# Preview resource creation (without actually creating)
kubectl create deployment test --image=nginx --dry-run=client -o yaml

# Copy file to pod
kubectl cp <local-file> <pod-name>:<pod-path>

# Copy file from pod to local
kubectl cp <pod-name>:<pod-path> <local-file>

# Wait for resource to be ready
kubectl wait --for=condition=ready pod/<pod-name>

# Replace resource
kubectl replace -f <file.yaml>

# Force replace resource
kubectl replace --force -f <file.yaml>

# View resource diff
kubectl diff -f <file.yaml>
```

## Common Command Combinations

```bash
# View all non-running pods
kubectl get pods -A --field-selector=status.phase!=Running

# Delete all evicted pods
kubectl get pods -A | grep Evicted | awk '{print $1, $2}' | xargs -n2 kubectl delete pod -n

# View all pod images
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[*].image}{"\n"}{end}'

# View all pod restart counts
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.containerStatuses[*].restartCount}{"\n"}{end}'

# Batch restart deployments
kubectl get deployments -o name | xargs -I {} kubectl rollout restart {}
```

## Tips

- Most commands support `-n <namespace>` to specify namespace
- Use `-A` or `--all-namespaces` to view resources across all namespaces
- Use `-o yaml` or `-o json` to view complete resource configuration
- Use `-w` or `--watch` to continuously monitor resource status
- Use `--dry-run=client` to validate commands without executing
- Use `kubectl <command> --help` to view detailed command help
