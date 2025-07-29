# Minikube & Kubernetes (kubectl) Commands Cheat Sheet

A handy reference for essential Minikube and Kubernetes commands with explanations and examples.

---

## Minikube Commands

| Command                                | Description                                     | Example                                |
|----------------------------------------|-------------------------------------------------|----------------------------------------|
| `minikube start`                       | Starts a local Kubernetes cluster.              | `minikube start --driver=virtualbox`   |
| `minikube stop`                        | Stops the Minikube cluster.                     | `minikube stop`                        |
| `minikube delete`                      | Deletes the Minikube cluster and VM.            | `minikube delete`                      |
| `minikube status`                      | Shows the status of the Minikube cluster.       | `minikube status`                      |
| `minikube dashboard`                   | Launches the Kubernetes Dashboard in a browser. | `minikube dashboard`                   |
| `minikube ip`                          | Displays Minikube cluster IP address.           | `minikube ip`                          |
| `minikube service <service>`           | Opens the service in browser.                   | `minikube service my-service`          |
| `minikube addons list`                 | Lists all Minikube addons.                      | `minikube addons list`                 |
| `minikube addons enable <addon>`       | Enables an addon (e.g., ingress).               | `minikube addons enable ingress`       |
| `minikube ssh`                         | SSH into the Minikube VM.                       | `minikube ssh`                         |
| `minikube service nginx-service --url` | Gets the url to access the running deployment   | `minikube service nginx-service --url` |


---

## Kubernetes (`kubectl`) Commands

### 🔍 View Resources

| Command                       | Description                       | Example                           |
|-------------------------------|-----------------------------------|-----------------------------------|
| `kubectl get nodes`           | Lists all nodes.                  | `kubectl get nodes`               |
| `kubectl get pods`            | Lists all pods in the namespace.  | `kubectl get pods -n kube-system` |
| `kubectl get services`        | Lists all services.               | `kubectl get svc`                 |
| `kubectl get deployments`     | Lists all deployments.            | `kubectl get deployments`         |
| `kubectl describe <resource>` | Describes detailed resource info. | `kubectl describe pod my-pod`     |

---

### Create / Apply Resources

| Command                                                              | Description                                         | Example                                                              |
|----------------------------------------------------------------------|-----------------------------------------------------|----------------------------------------------------------------------|
| `kubectl get pods`                                                   | Lists all Pods.                                     | `kubectl get pods`                                                   |
| `kubectl get svc`                                                    | Lists all Services.                                 | `kubectl get svc`                                                    |
| `kubectl get deployments`                                            | Lists all Deployments.                              | `kubectl get deployments`                                            |
| `kubectl get rs`                                                     | Lists all ReplicaSets.                              | `kubectl get rs`                                                     |
| `kubectl get cm`                                                     | Lists all ConfigMaps.                               | `kubectl get cm`                                                     |
| `kubectl get secret`                                                 | Lists all Secrets.                                  | `kubectl get secret`                                                 |
| `kubectl get pvc`                                                    | Lists all Persistent Volume Claims.                 | `kubectl get pvc`                                                    |
| `kubectl get ingressclass`                                           | Lists all ingress classes (nginx).                  | `kubectl get ingressclass`                                           |
| `kubectl get pv`                                                     | Lists all Persistent Volumes.                       | `kubectl get pv`                                                     |
| `kubectl get ingress`                                                | Lists all Ingress resources.                        | `kubectl get ingress`                                                |
| `kubectl get job`                                                    | Lists all batch Jobs.                               | `kubectl get job`                                                    |
| `kubectl get cronjob`                                                | Lists all scheduled CronJobs.                       | `kubectl get cronjob`                                                |
| `kubectl get sa`                                                     | Lists all ServiceAccounts.                          | `kubectl get sa`                                                     |
| `kubectl get hpa`                                                    | Lists all Horizontal Pod Autoscalers.               | `kubectl get hpa`                                                    |
| `kubectl get all`                                                    | Lists core workloads (pods, svc, deploy, rs).       | `kubectl get all`                                                    |
| `kubectl get all,cm,secret,pvc,ingress,job,cronjob`                  | Lists all key workload and configuration resources. | `kubectl get all,cm,secret,pvc,ingress,job,cronjob`                  |
| `kubectl get all,cm,secret,pvc,ingress,job,cronjob -n <namespace>`   | Same as above but for a specific namespace.         | `kubectl get all,cm,secret,pvc,ingress,job,cronjob -n dev`           |
| `kubectl get all,cm,secret,pvc,ingress,job,cronjob --all-namespaces` | Lists everything across all namespaces.             | `kubectl get all,cm,secret,pvc,ingress,job,cronjob --all-namespaces` |

---

## Create / Apply / Update Resources

| Command                           | Description                             | Example                                     |
|-----------------------------------|-----------------------------------------|---------------------------------------------|
| `kubectl apply -f <file>`         | Applies a YAML configuration.           | `kubectl apply -f deployment.yaml`          |
| `kubectl create -f <file>`        | Creates resources defined in YAML.      | `kubectl create -f service.yaml`            |
| `kubectl replace -f <file>`       | Replaces existing resource with YAML.   | `kubectl replace -f configmap.yaml`         |
| `kubectl edit <resource> <name>`  | Edit a resource directly in the editor. | `kubectl edit deployment my-deploy`         |
| `kubectl patch <resource> <name>` | Patch fields of a live resource.        | `kubectl patch deployment my-deploy -p ...` |

---

### Delete Resources

| Command                           | Description                                 | Example                               |
|-----------------------------------|---------------------------------------------|---------------------------------------|
| `kubectl delete -f <file>`        | Deletes resources defined in a file.        | `kubectl delete -f deployment.yaml`   |
| `kubectl delete pod <pod>`        | Deletes a specific pod.                     | `kubectl delete pod my-pod`           |
| `kubectl delete service <svc>`    | Deletes a service.                          | `kubectl delete svc my-service`       |
| `kubectl delete deployment <dep>` | Deletes a deployment.                       | `kubectl delete deployment my-deploy` |
| `kubectl delete all --all`        | Deletes all resources in current namespace. | `kubectl delete all --all`            |

---

### Logs & Shell Access

| Command                               | Description                    | Example                                   |
|---------------------------------------|--------------------------------|-------------------------------------------|
| `kubectl logs <pod>`                  | Shows logs of a pod.           | `kubectl logs nginx-pod`                  |
| `kubectl exec -it <pod> -- <command>` | Execute commands inside a pod. | `kubectl exec -it nginx-pod -- /bin/bash` |

---

### Port Forwarding & Services

| Command                                               | Description                | Example                                   |
|-------------------------------------------------------|----------------------------|-------------------------------------------|
| `kubectl port-forward <pod/service> <local>:<remote>` | Forward pod/service ports. | `kubectl port-forward svc/my-svc 8080:80` |

---

### Context & Namespace Management

| Command                               | Description                       | Example                               |
|---------------------------------------|-----------------------------------|---------------------------------------|
| `kubectl config use-context minikube` | Switch context to Minikube.       | `kubectl config use-context minikube` |
| `kubectl config get-contexts`         | View available contexts.          | `kubectl config get-contexts`         |
| `kubectl get pods -n <namespace>`     | Get pods in a specific namespace. | `kubectl get pods -n kube-system`     |


---

## YAML Example: Simple Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
