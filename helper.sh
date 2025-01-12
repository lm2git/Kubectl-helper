#!/bin/bash

# -----------------------------------------------------------------------------
# Kubernetes Helper Script with Interactive Menu
# Includes commands for CKAD, CKA, and CKS exam preparation
# -----------------------------------------------------------------------------

# Define text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset to default color

# Utility function to echo with color
color_echo() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${RESET}"
}

# Utility function to display menus
show_menu() {
    color_echo "${CYAN}" "Kubernetes Command Helper - Main Menu"
    color_echo "${BLUE}" "-------------------------------------"
    color_echo "${GREEN}" "1. ${YELLOW}Work with API Versions"
    color_echo "${GREEN}" "2. ${YELLOW}Manage Custom Resource Definitions (CRDs)"
    color_echo "${GREEN}" "3. ${YELLOW}Handle Pods"
    color_echo "${GREEN}" "4. ${YELLOW}Manage Deployments"
    color_echo "${GREEN}" "5. ${YELLOW}Work with Services"
    color_echo "${GREEN}" "6. ${YELLOW}Namespace Operations"
    color_echo "${GREEN}" "7. ${YELLOW}ConfigMaps and Secrets"
    color_echo "${GREEN}" "8. ${YELLOW}Persistent Volumes and Claims"
    color_echo "${GREEN}" "9. ${YELLOW}ReplicaSets and DaemonSets"
    color_echo "${GREEN}" "10. ${YELLOW}Jobs and CronJobs"
    color_echo "${GREEN}" "11. ${YELLOW}Advanced Debugging"
    color_echo "${GREEN}" "12. ${YELLOW}YAML Generation and Editing"
    color_echo "${GREEN}" "13. ${YELLOW}Advanced Usage"
    color_echo "${GREEN}" "14. ${YELLOW}Security and Access Management"
    color_echo "${GREEN}" "15. ${YELLOW}Miscellaneous Commands"
    color_echo "${GREEN}" "16. ${YELLOW}Cluster Status and General Information"
    color_echo "${GREEN}" "17. ${YELLOW}Resource Problem Identification"
    color_echo "${GREEN}" "18. ${YELLOW}Node Analysis and Troubleshooting"
    color_echo "${GREEN}" "19. ${YELLOW}Network Troubleshooting"
    color_echo "${GREEN}" "20. ${YELLOW}Resource Utilization Verification"
    color_echo "${GREEN}" "21. ${YELLOW}Rollout and Update Troubleshooting"
    color_echo "${GREEN}" "22. ${YELLOW}Events and Diagnostics"
    color_echo "${RED}" "0. ${YELLOW}Exit"
    color_echo "${BLUE}" "-------------------------------------"
    echo -n "Select an option: "
}

# Function for each menu item
api_versions() {
    color_echo "${PURPLE}" "# Work with API Versions"
    color_echo "${GREEN}" "# Display all available API versions in the cluster"
    color_echo "${YELLOW}" "kubectl api-versions"
    color_echo "${GREEN}" "# Explain a specific resource (e.g., pod) in a particular API version"
    color_echo "${YELLOW}" "kubectl explain pod --api-version=<api-version>"
    color_echo "${GREEN}" "# Explore specific resources in an API version"
    color_echo "${YELLOW}" "kubectl explain deployment.v1.apps"
    ask_return_to_menu
}

crd_operations() {
    color_echo "${PURPLE}" "# Manage Custom Resource Definitions (CRDs)"
    color_echo "${GREEN}" "# List all CRDs in the cluster"
    color_echo "${YELLOW}" "kubectl get crds"
    color_echo "${GREEN}" "# Describe a specific CRD"
    color_echo "${YELLOW}" "kubectl describe crd <crd-name>"
    color_echo "${GREEN}" "# Create a CRD from a YAML file"
    color_echo "${YELLOW}" "kubectl apply -f <crd-definition-file>.yaml"
    color_echo "${GREEN}" "# Delete a specific CRD"
    color_echo "${YELLOW}" "kubectl delete crd <crd-name>"
    ask_return_to_menu
}

pod_operations() {
    color_echo "${PURPLE}" "# Handle Pods"
    color_echo "${GREEN}" "# List all pods in the cluster"
    color_echo "${YELLOW}" "kubectl get pods"
    color_echo "${GREEN}" "# Describe a specific pod"
    color_echo "${YELLOW}" "kubectl describe pod <pod-name>"
    color_echo "${GREEN}" "# Get logs from a pod"
    color_echo "${YELLOW}" "kubectl logs <pod-name>"
    color_echo "${GREEN}" "# Follow logs of a pod in real-time"
    color_echo "${YELLOW}" "kubectl logs -f <pod-name>"
    color_echo "${GREEN}" "# Execute a command inside a pod"
    color_echo "${YELLOW}" "kubectl exec -it <pod-name> -- <command>"
    color_echo "${GREEN}" "# Visualizza risorse in formato wide"
    color_echo "${YELLOW}" "kubectl get pods -o wide"
    color_echo "${GREEN}" "# Visualizza risorse in formato JSON"
    color_echo "${YELLOW}" "kubectl get pods -o json"
    color_echo "${GREEN}" "# Visualizza risorse in formato YAML"
    color_echo "${YELLOW}" "kubectl get pods -o yaml"
    color_echo "${GREEN}" "# Filtra le risorse con una specifica etichetta"
    color_echo "${YELLOW}" "kubectl get pods -l app=<label-value>"
    color_echo "${GREEN}" "# Mostra solo i nomi delle risorse"
    color_echo "${YELLOW}" "kubectl get pods --no-headers -o custom-columns=':metadata.name'"
    ask_return_to_menu
}

deployment_operations() {
    color_echo "${PURPLE}" "# Manage Deployments"
    color_echo "${GREEN}" "# List all deployments"
    color_echo "${YELLOW}" "kubectl get deployments"
    color_echo "${GREEN}" "# Create a deployment with a specific image"
    color_echo "${YELLOW}" "kubectl create deployment <deployment-name> --image=<image-name>"
    color_echo "${GREEN}" "# Scale a deployment"
    color_echo "${YELLOW}" "kubectl scale deployment <deployment-name> --replicas=<num-replicas>"
    color_echo "${GREEN}" "# Update a deployment with a new image"
    color_echo "${YELLOW}" "kubectl set image deployment/<deployment-name> <container-name>=<new-image-name>"
    color_echo "${GREEN}" "# Rollback a deployment"
    color_echo "${YELLOW}" "kubectl rollout undo deployment/<deployment-name>"
    color_echo "${GREEN}" "# Check rollout status of a deployment"
    color_echo "${YELLOW}" "kubectl rollout status deployment/<deployment-name>"
    color_echo "${GREEN}" "# Pause a deployment rollout"
    color_echo "${YELLOW}" "kubectl rollout pause deployment/<deployment-name>"
    color_echo "${GREEN}" "# Resume a deployment rollout"
    color_echo "${YELLOW}" "kubectl rollout resume deployment/<deployment-name>"
    color_echo "${GREEN}" "# Show deployment rollout history"
    color_echo "${YELLOW}" "kubectl rollout history deployment/<deployment-name>"
    ask_return_to_menu
}

service_operations() {
    color_echo "${PURPLE}" "# Work with Services"
    color_echo "${GREEN}" "# List all services"
    color_echo "${YELLOW}" "kubectl get services"
    color_echo "${GREEN}" "# Create a LoadBalancer service"
    color_echo "${YELLOW}" "kubectl expose deployment <deployment-name> --type=LoadBalancer --port=80 --target-port=8080"
    color_echo "${GREEN}" "# Create a ClusterIP service"
    color_echo "${YELLOW}" "kubectl expose deployment <deployment-name> --type=ClusterIP --port=80 --target-port=8080"
    color_echo "${GREEN}" "# Describe a specific service"
    color_echo "${YELLOW}" "kubectl describe service <service-name>"
    ask_return_to_menu
}

namespace_operations() {
    color_echo "${PURPLE}" "# Namespace Operations"
    color_echo "${GREEN}" "# List all namespaces"
    color_echo "${YELLOW}" "kubectl get namespaces"
    color_echo "${GREEN}" "# Switch the current namespace"
    color_echo "${YELLOW}" "kubectl config set-context --current --namespace=<namespace-name>"
    color_echo "${GREEN}" "# Create a new namespace"
    color_echo "${YELLOW}" "kubectl create namespace <namespace-name>"
    color_echo "${GREEN}" "# View resources across all namespaces"
    color_echo "${YELLOW}" "kubectl get pods --all-namespaces"
    color_echo "${GREEN}" "# View resources in a specific namespace"
    color_echo "${YELLOW}" "kubectl get pods -n <namespace-name>"
    color_echo "${GREEN}" "# Delete a namespace"
    color_echo "${YELLOW}" "kubectl delete namespace <namespace-name>"
    ask_return_to_menu
}

configmaps_and_secrets() {
    color_echo "${PURPLE}" "# ConfigMaps and Secrets"
    color_echo "${GREEN}" "# List all ConfigMaps"
    color_echo "${YELLOW}" "kubectl get configmaps"
    color_echo "${GREEN}" "# Create a ConfigMap from a file"
    color_echo "${YELLOW}" "kubectl create configmap <configmap-name> --from-file=<file-path>"
    color_echo "${GREEN}" "# Describe a ConfigMap"
    color_echo "${YELLOW}" "kubectl describe configmap <configmap-name>"
    color_echo "${GREEN}" "# Extract data from a ConfigMap"
    color_echo "${YELLOW}" "kubectl get configmap <configmap-name> -o jsonpath='{.data.<key>}'"
    color_echo "${GREEN}" "# List all Secrets"
    color_echo "${YELLOW}" "kubectl get secrets"
    color_echo "${GREEN}" "# Create a Secret from a file"
    color_echo "${YELLOW}" "kubectl create secret generic <secret-name> --from-file=<file-path>"
    color_echo "${GREEN}" "# Describe a Secret"
    color_echo "${YELLOW}" "kubectl describe secret <secret-name>"
    color_echo "${GREEN}" "# Extract data from a Secret"
    color_echo "${YELLOW}" "kubectl get secret <secret-name> -o jsonpath='{.data.<key>}' | base64 --decode"
    ask_return_to_menu
}

pv_and_pvc_operations() {
    color_echo "${PURPLE}" "# Persistent Volumes and Claims"
    color_echo "${GREEN}" "# List all Persistent Volumes"
    color_echo "${YELLOW}" "kubectl get pv"
    color_echo "${GREEN}" "# List all Persistent Volume Claims"
    color_echo "${YELLOW}" "kubectl get pvc"
    color_echo "${GREEN}" "# Describe a Persistent Volume"
    color_echo "${YELLOW}" "kubectl describe pv <pv-name>"
    color_echo "${GREEN}" "# Describe a Persistent Volume Claim"
    color_echo "${YELLOW}" "kubectl describe pvc <pvc-name>"
    color_echo "${GREEN}" "# Create a Persistent Volume"
    color_echo "${YELLOW}" "kubectl apply -f <pv-definition-file>.yaml"
    color_echo "${GREEN}" "# Create a Persistent Volume Claim"
    color_echo "${YELLOW}" "kubectl apply -f <pvc-definition-file>.yaml"
    ask_return_to_menu
}

# Ask if the user wants to return to the main menu
ask_return_to_menu() {
    color_echo "${BLUE}" "Do you want to return to the main menu? (y/n)"
    read return_choice
    if [[ "$return_choice" == "y" || "$return_choice" == "Y" ]]; then
        clear
        show_menu
        read choice
        case $choice in
            1) api_versions ;;
            2) crd_operations ;;
            3) pod_operations ;;
            4) deployment_operations ;;
            5) service_operations ;;
            6) namespace_operations ;;
            7) configmaps_and_secrets ;;
            8) pv_and_pvc_operations ;;
            *) echo "Invalid choice" ;;
        esac
    else
        color_echo "${RED}" "Exiting..."
        exit 0
    fi
}

# Main program loop
show_menu
read choice
case $choice in
    1) api_versions ;;
    2) crd_operations ;;
    3) pod_operations ;;
    4) deployment_operations ;;
    5) service_operations ;;
    6) namespace_operations ;;
    7) configmaps_and_secrets ;;
    8) pv_and_pvc_operations ;;
    *) echo "Invalid choice" ;;
esac
