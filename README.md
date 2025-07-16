# Kubernetes & Minikube (kubectl) Commands Cheat Sheet

A handy reference for essential Minikube and Kubernetes commands with explanations and examples.

---
# 🧱 Minikube Commands

| Command                           | Description                                       | Example                                |
|-----------------------------------|---------------------------------------------------|----------------------------------------|
| `minikube start`                  | Starts a local Kubernetes cluster.                | `minikube start --driver=virtualbox`   |
| `minikube stop`                   | Stops the Minikube cluster.                       | `minikube stop`                        |
| `minikube delete`                 | Deletes the Minikube cluster and VM.              | `minikube delete`                      |
| `minikube status`                 | Shows the status of the Minikube cluster.         | `minikube status`                      |
| `minikube dashboard`              | Launches the Kubernetes Dashboard in a browser.   | `minikube dashboard`                   |
| `minikube ip`                     | Displays Minikube cluster IP address.             | `minikube ip`                          |
| `minikube ssh`                    | SSH into the Minikube VM.                         | `minikube ssh`                         |
| `minikube addons list`            | Lists all Minikube addons.                        | `minikube addons list`                 |
| `minikube addons enable <addon>`  | Enables an addon (e.g., ingress, metrics-server). | `minikube addons enable ingress`       |
| `minikube addons disable <addon>` | Disables a Minikube addon.                        | `minikube addons disable ingress`      |
| `minikube service <svc>`          | Opens the service in default browser.             | `minikube service dev-auth-service`    |
| `minikube service <svc> --url`    | Gets the service's accessible URL.                | `minikube service nginx-service --url` |
| `minikube image load <image>`     | Loads a local Docker image into Minikube.         | `minikube image load dev-auth:latest`  |
| `minikube mount <local>:<vm>`     | Mounts a host dir into Minikube VM.               | `minikube mount ./data:/data`          |
| `minikube tunnel`                 | Creates a tunnel to expose LoadBalancer service.  | `minikube tunnel`                      |

---

# ⚙️ Kubernetes (`kubectl`) Commands

## 🔍 View Resources

| Command                                                    | Description                                   | Example                            |
|------------------------------------------------------------|-----------------------------------------------|------------------------------------|
| `kubectl get nodes`                                        | Lists all nodes in the cluster.               | `kubectl get nodes`                |
| `kubectl get pods`                                         | Lists all pods in current/default namespace.  | `kubectl get pods`                 |
| `kubectl get svc`                                          | Lists all services.                           | `kubectl get svc`                  |
| `kubectl get deployments`                                  | Lists all deployments.                        | `kubectl get deployments`          |
| `kubectl get all`                                          | Lists all resources (pods, svc, deploy, etc). | `kubectl get all`                  |
| `kubectl describe <res> <name>`                            | Describes a resource in detail.               | `kubectl describe pod my-pod`      |
| `kubectl get events --sort-by=.metadata.creationTimestamp` | View recent events.                           | `kubectl get events --sort-by=...` |

---

## 📦 Create / Apply / Update Resources

| Command                           | Description                             | Example                                     |
|-----------------------------------|-----------------------------------------|---------------------------------------------|
| `kubectl apply -f <file>`         | Applies a YAML configuration.           | `kubectl apply -f deployment.yaml`          |
| `kubectl create -f <file>`        | Creates resources defined in YAML.      | `kubectl create -f service.yaml`            |
| `kubectl replace -f <file>`       | Replaces existing resource with YAML.   | `kubectl replace -f configmap.yaml`         |
| `kubectl edit <resource> <name>`  | Edit a resource directly in the editor. | `kubectl edit deployment my-deploy`         |
| `kubectl patch <resource> <name>` | Patch fields of a live resource.        | `kubectl patch deployment my-deploy -p ...` |

---

## 🗑️ Delete Resources

| Command                            | Description                                 | Example                               |
|------------------------------------|---------------------------------------------|---------------------------------------|
| `kubectl delete -f <file>`         | Deletes resources defined in a file.        | `kubectl delete -f deployment.yaml`   |
| `kubectl delete pod <pod>`         | Deletes a specific pod.                     | `kubectl delete pod my-pod`           |
| `kubectl delete svc <service>`     | Deletes a service.                          | `kubectl delete svc dev-auth-service` |
| `kubectl delete deployment <name>` | Deletes a deployment.                       | `kubectl delete deployment dev-auth`  |
| `kubectl delete all --all`         | Deletes all resources in current namespace. | `kubectl delete all --all`            |
| `kubectl delete configmap <name>`  | Deletes a ConfigMap.                        | `kubectl delete configmap my-config`  |
| `kubectl delete secret <name>`     | Deletes a Secret.                           | `kubectl delete secret my-secret`     |

---

## 📄 Logs & Debugging

| Command                               | Description                                | Example                                       |
|---------------------------------------|--------------------------------------------|-----------------------------------------------|
| `kubectl logs <pod>`                  | View logs from a pod.                      | `kubectl logs my-pod`                         |
| `kubectl logs <pod> -c <container>`   | Logs from a specific container in a pod.   | `kubectl logs my-pod -c my-container`         |
| `kubectl exec -it <pod> -- <cmd>`     | Run command inside pod (interactive).      | `kubectl exec -it my-pod -- /bin/sh`          |
| `kubectl cp <pod>:<path> <local>`     | Copy files from pod to local system.       | `kubectl cp my-pod:/app/logs ./logs`          |
| `kubectl top pod`                     | Show resource usage (requires metrics).    | `kubectl top pod`                             |
| `kubectl top node`                    | Show resource usage per node.              | `kubectl top node`                            |

---

## 🌐 Networking & Port Forwarding

| Command                                            | Description                       | Example                                                     |
|----------------------------------------------------|-----------------------------------|-------------------------------------------------------------|
| `kubectl port-forward <pod/svc> <local>:<remote>`  | Port forward to pod/service.      | `kubectl port-forward svc/dev-auth 8080:8080`               |
| `kubectl expose deployment <name> --type=NodePort` | Expose a deployment as a service. | `kubectl expose deployment nginx --port=80 --type=NodePort` |
| `kubectl get ingress`                              | Lists all ingress resources.      | `kubectl get ingress`                                       |
| `kubectl describe ingress <name>`                  | Shows details about an ingress.   | `kubectl describe ingress my-ingress`                       |

---

## 📂 Config, Context & Namespace

| Command                                                 | Description                                | Example                                                |
|---------------------------------------------------------|--------------------------------------------|--------------------------------------------------------|
| `kubectl config use-context <name>`                     | Switches current context.                  | `kubectl config use-context minikube`                  |
| `kubectl config get-contexts`                           | Lists all contexts.                        | `kubectl config get-contexts`                          |
| `kubectl config current-context`                        | Shows current context.                     | `kubectl config current-context`                       |
| `kubectl get pods -n <namespace>`                       | Get pods in a specific namespace.          | `kubectl get pods -n kube-system`                      |
| `kubectl create namespace <name>`                       | Create a new namespace.                    | `kubectl create namespace staging`                     |
| `kubectl delete namespace <name>`                       | Delete a namespace.                        | `kubectl delete namespace staging`                     |
| `kubectl config set-context --current --namespace=<ns>` | Set default namespace for current context. | `kubectl config set-context --current --namespace=dev` |

---

## 🔄 Rolling Updates & Scale

| Command                                        | Description                           | Example                                          |
|------------------------------------------------|---------------------------------------|--------------------------------------------------|
| `kubectl rollout restart deployment <name>`    | Restart the pods in a deployment.     | `kubectl rollout restart deployment dev-auth`    |
| `kubectl rollout status deployment <name>`     | Watch rollout progress.               | `kubectl rollout status deployment dev-auth`     |
| `kubectl scale deployment <name> --replicas=N` | Scale number of pods in a deployment. | `kubectl scale deployment dev-auth --replicas=3` |

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
