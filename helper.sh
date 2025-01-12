#!/bin/bash

# -----------------------------------------------------------------------------
# Kubernetes Helper Script with Interactive Menu
# Includes commands for CKAD, CKA, and CKS exam preparation
# -----------------------------------------------------------------------------

# Utility function to display menus
show_menu() {
    echo "Kubernetes Command Helper - Main Menu"
    echo "-------------------------------------"
    echo "1. Work with API Versions"
    echo "2. Manage Custom Resource Definitions (CRDs)"
    echo "3. Handle Pods"
    echo "4. Manage Deployments"
    echo "5. Work with Services"
    echo "6. Namespace Operations"
    echo "7. ConfigMaps and Secrets"
    echo "8. Persistent Volumes and Claims"
    echo "9. ReplicaSets and DaemonSets"
    echo "10. Jobs and CronJobs"
    echo "11. Advanced Debugging"
    echo "12. YAML Generation and Editing"
    echo "13. Advanced Usage"
    echo "14. Security and Access Management"
    echo "15. Miscellaneous Commands"
    echo "16. Cluster Status and General Information"
    echo "17. Resource Problem Identification"
    echo "18. Node Analysis and Troubleshooting"
    echo "19. Network Troubleshooting"
    echo "20. Resource Utilization Verification"
    echo "21. Rollout and Update Troubleshooting"
    echo "22. Events and Diagnostics"
    echo "0. Exit"
    echo "-------------------------------------"
    echo -n "Select an option: "
}

# Function for each menu item
api_versions() {
    echo "# Work with API Versions"
    echo "# Display all available API versions in the cluster"
    kubectl api-versions
    echo "\n# Explain a specific resource (e.g., pod) in a particular API version"
    kubectl explain pod --api-version=<api-version>
    echo "\n# Explore specific resources in an API version"
    kubectl explain deployment.v1.apps
}

crd_operations() {
    echo "# Manage Custom Resource Definitions (CRDs)"
    echo "# List all CRDs in the cluster"
    kubectl get crds
    echo "\n# Describe a specific CRD"
    kubectl describe crd <crd-name>
    echo "\n# Create a CRD from a YAML file"
    kubectl apply -f <crd-definition-file>.yaml
    echo "\n# Delete a specific CRD"
    kubectl delete crd <crd-name>
}

pod_operations() {
    echo "# Handle Pods"
    echo "# List all pods in the cluster"
    kubectl get pods
    echo "\n# Describe a specific pod"
    kubectl describe pod <pod-name>
    echo "\n# Get logs from a pod"
    kubectl logs <pod-name>
    echo "\n# Follow logs of a pod in real-time"
    kubectl logs -f <pod-name>
    echo "\n# Execute a command inside a pod"
    kubectl exec -it <pod-name> -- <command>
    echo "\n# Visualizza risorse in formato wide"
    kubectl get pods -o wide
    echo "\n# Visualizza risorse in formato JSON"
    kubectl get pods -o json
    echo "\n# Visualizza risorse in formato YAML"
    kubectl get pods -o yaml
    echo "\n# Filtra le risorse con una specifica etichetta"
    kubectl get pods -l app=<label-value>
    echo "\n# Mostra solo i nomi delle risorse"
    kubectl get pods --no-headers -o custom-columns=":metadata.name"
}

deployment_operations() {
    echo "# Manage Deployments"
    echo "# List all deployments"
    kubectl get deployments
    echo "\n# Create a deployment with a specific image"
    kubectl create deployment <deployment-name> --image=<image-name>
    echo "\n# Scale a deployment"
    kubectl scale deployment <deployment-name> --replicas=<num-replicas>
    echo "\n# Update a deployment with a new image"
    kubectl set image deployment/<deployment-name> <container-name>=<new-image-name>
    echo "\n# Rollback a deployment"
    kubectl rollout undo deployment/<deployment-name>
    echo "\n# Check rollout status of a deployment"
    kubectl rollout status deployment/<deployment-name>
    echo "\n# Pausa il rollout di un deployment"
    kubectl rollout pause deployment/<deployment-name>
    echo "\n# Riprendi il rollout di un deployment"
    kubectl rollout resume deployment/<deployment-name>
    echo "\n# Mostra la cronologia del rollout di un deployment"
    kubectl rollout history deployment/<deployment-name>
}

service_operations() {
    echo "# Work with Services"
    echo "# List all services"
    kubectl get services
    echo "\n# Create a LoadBalancer service"
    kubectl expose deployment <deployment-name> --type=LoadBalancer --port=80 --target-port=8080
    echo "\n# Create a ClusterIP service"
    kubectl expose deployment <deployment-name> --type=ClusterIP --port=80 --target-port=8080
    echo "\n# Describe a specific service"
    kubectl describe service <service-name>
}

namespace_operations() {
    echo "# Namespace Operations"
    echo "# List all namespaces"
    kubectl get namespaces
    echo "\n# Switch the current namespace"
    kubectl config set-context --current --namespace=<namespace-name>
    echo "\n# Create a new namespace"
    kubectl create namespace <namespace-name>
    echo "\n# Visualizza risorse in tutti i namespace"
    kubectl get pods --all-namespaces
    echo "\n# Visualizza risorse in un namespace specifico"
    kubectl get pods -n <namespace-name>
    echo "\n# Elimina un namespace"
    kubectl delete namespace <namespace-name>
}

configmaps_and_secrets() {
    echo "# ConfigMaps and Secrets"
    echo "# List all ConfigMaps"
    kubectl get configmaps
    echo "\n# Create a ConfigMap from a file"
    kubectl create configmap <configmap-name> --from-file=<file-path>
    echo "\n# Describe a ConfigMap"
    kubectl describe configmap <configmap-name>
    echo "\n# Estrai dati da un ConfigMap"
    kubectl get configmap <configmap-name> -o jsonpath='{.data.<key>}'
    echo "\n# List all Secrets"
    kubectl get secrets
    echo "\n# Create a Secret from a file"
    kubectl create secret generic <secret-name> --from-file=<file-path>
    echo "\n# Describe a Secret"
    kubectl describe secret <secret-name>
    echo "\n# Estrai dati da un Secret"
    kubectl get secret <secret-name> -o jsonpath='{.data.<key>}' | base64 --decode
}

pv_and_pvc_operations() {
    echo "# Persistent Volumes and Claims"
    echo "# List all Persistent Volumes"
    kubectl get pv
    echo "\n# List all Persistent Volume Claims"
    kubectl get pvc
    echo "\n# Describe a Persistent Volume Claim"
    kubectl describe pvc <pvc-name>
}

replicasets_and_daemonsets() {
    echo "# ReplicaSets and DaemonSets"
    echo "# List all ReplicaSets"
    kubectl get replicasets
    echo "\n# Describe a specific ReplicaSet"
    kubectl describe replicaset <replicaset-name>
    echo "\n# List all DaemonSets"
    kubectl get daemonsets
}

jobs_and_cronjobs() {
    echo "# Jobs and CronJobs"
    echo "# List all Jobs"
    kubectl get jobs
    echo "\n# List all CronJobs"
    kubectl get cronjobs
    echo "\n# Create a CronJob"
    kubectl create cronjob <cronjob-name> --schedule="*/5 * * * *" --image=<image-name>
    echo "\n# Genera YAML per creare un Job da un pod esistente"
    kubectl create job <job-name> --from=pod/<pod-name> --dry-run=client -o yaml
    echo "\n# Genera YAML per un CronJob da un Job esistente"
    kubectl create cronjob <cronjob-name> --schedule="0 0 * * *" --image=<image-name> --dry-run=client -o yaml
}

advanced_debugging() {
    echo "# Advanced Debugging"
    echo "# View recent events in the cluster"
    kubectl get events --sort-by='.lastTimestamp'
    echo "\n# Find pods in CrashLoopBackOff state"
    kubectl get pods --field-selector=status.phase!=Running
    echo "\n# Describe a failing pod"
    kubectl describe pod <pod-name>
    echo "\n# View resource usage for nodes"
    kubectl top nodes
    echo "\n# View resource usage for pods"
    kubectl top pods
    echo "\n# Debug di un pod con kubectl debug"
    kubectl debug pod/<pod-name> -it --image=busybox --target=<container-name>
    echo "\n# Crea una shell temporanea in un container di debug"
    kubectl run -i --tty debug --image=busybox --restart=Never -- sh
}

yaml_generation() {
    echo "# YAML Generation and Editing"
    echo "# Generate YAML for a Deployment"
    kubectl get deployment <deployment-name> -o yaml
    echo "\n# Generate YAML for a scaled Deployment"
    kubectl scale deployment <deployment-name> --replicas=5 --dry-run=client -o yaml
    echo "\n# Create YAML for a Pod using dry-run"
    kubectl run <pod-name> --image=<image-name> --dry-run=client -o yaml > <file-name>.yaml
}

advanced_usage() {
    echo "# Advanced Usage"
    echo "# Patch a resource"
    kubectl patch <resource> <name> -p '{"spec": {"replicas": 3}}'
    echo "\n# Simulate changes without applying them"
    kubectl apply -f <file.yaml> --dry-run=client
    echo "\n# Filter resources using grep"
    kubectl get pods --no-headers | grep <pattern>
    echo "\n# Estrarre nomi di tutti i nodi"
    kubectl get nodes -o jsonpath='{.items[*].metadata.name}'
    echo "\n# Estrai indirizzi IP dei nodi"
    kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'
}

security_and_access_management() {
    echo "# Security and Access Management"
    echo "# List all roles in the cluster"
    kubectl get roles --all-namespaces
    echo "\n# List all role bindings"
    kubectl get rolebindings --all-namespaces
    echo "\n# Create a role binding"
    kubectl create rolebinding <rolebinding-name> --role=<role-name> --user=<user-name> --namespace=<namespace-name>
    echo "\n# Create a service account"
    kubectl create serviceaccount <service-account-name> --namespace=<namespace-name>
    echo "\n# List all service accounts"
    kubectl get serviceaccounts --namespace=<namespace-name>
    echo "\n# Describe a service account"
    kubectl describe serviceaccount <service-account-name> --namespace=<namespace-name>
    echo "\n# View RBAC policies"
    kubectl get clusterrolebinding
}

miscellaneous_commands() {
    echo "# Miscellaneous Commands"
    echo "# Get cluster information"
    kubectl cluster-info
    echo "\n# Get the version of kubectl and the cluster"
    kubectl version
    echo "\n# Show the current context"
    kubectl config current-context
    echo "\n# List all contexts"
    kubectl config get-contexts
    echo "\n# Switch to a different context"
    kubectl config use-context <context-name>
}

cluster_status_and_info() {
    echo "# Cluster Status and General Information"
    echo "# Get general information about the cluster"
    kubectl cluster-info
    echo "\n# Get nodes status"
    kubectl get nodes
    echo "\n# Get node resources"
    kubectl describe node <node-name>
    echo "\n# Get the status of all pods in the cluster"
    kubectl get pods --all-namespaces
}

resource_problem_identification() {
    echo "# Resource Problem Identification"
    echo "# Check pod status for issues"
    kubectl get pods --field-selector=status.phase!=Running
    echo "\n# Identify unhealthy deployments"
    kubectl get deployments --field-selector=status.replicas!=status.availableReplicas
    echo "\n# Get events related to a specific pod"
    kubectl describe pod <pod-name>
}

node_analysis_troubleshooting() {
    echo "# Node Analysis and Troubleshooting"
    echo "# View node status"
    kubectl describe node <node-name>
    echo "\n# Get pod logs for a node"
    kubectl logs <pod-name> --node=<node-name>
    echo "\n# Describe node's system status"
    kubectl describe node <node-name> --show-events
}

network_troubleshooting() {
    echo "# Network Troubleshooting"
    echo "# Check services and their endpoints"
    kubectl get endpoints
    echo "\n# Troubleshoot DNS issues"
    kubectl exec -it <pod-name> -- nslookup <service-name>
    echo "\n# Get pod network policies"
    kubectl get networkpolicies --all-namespaces
}

resource_utilization_verification() {
    echo "# Resource Utilization Verification"
    echo "# Check resource usage of pods"
    kubectl top pods
    echo "\n# Check resource usage of nodes"
    kubectl top nodes
    echo "\n# Get CPU and memory usage for a pod"
    kubectl top pod <pod-name>
}

rollout_and_update_troubleshooting() {
    echo "# Rollout and Update Troubleshooting"
    echo "# Check rollout status"
    kubectl rollout status deployment/<deployment-name>
    echo "\n# Rollback a deployment"
    kubectl rollout undo deployment/<deployment-name>
    echo "\n# Pause a rollout"
    kubectl rollout pause deployment/<deployment-name>
    echo "\n# Resume a rollout"
    kubectl rollout resume deployment/<deployment-name>
}

events_and_diagnostics() {
    echo "# Events and Diagnostics"
    echo "# Get all events in the cluster"
    kubectl get events --sort-by='.lastTimestamp'
    echo "\n# Describe a pod's events"
    kubectl describe pod <pod-name>
    echo "\n# Tail events from a specific namespace"
    kubectl get events -n <namespace-name> --watch
}

# Main interactive menu logic
while true; do
    show_menu
    read -r option
    case $option in
        1) api_versions ;;
        2) crd_operations ;;
        3) pod_operations ;;
        4) deployment_operations ;;
        5) service_operations ;;
        6) namespace_operations ;;
        7) configmaps_and_secrets ;;
        8) pv_and_pvc_operations ;;
        9) replicasets_and_daemonsets ;;
        10) jobs_and_cronjobs ;;
        11) advanced_debugging ;;
        12) yaml_generation ;;
        13) advanced_usage ;;
        14) security_and_access_management ;;
        15) miscellaneous_commands ;;
        16) cluster_status_and_info ;;
        17) resource_problem_identification ;;
        18) node_analysis_troubleshooting ;;
        19) network_troubleshooting ;;
        20) resource_utilization_verification ;;
        21) rollout_and_update_troubleshooting ;;
        22) events_and_diagnostics ;;
        0) exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done