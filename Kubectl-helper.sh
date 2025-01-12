#!/bin/bash

# =============================================
# Kubernetes Troubleshooting Script
# =============================================

# Funzione di help
function show_help() {
  echo "Usage: ./k8s_troubleshooting.sh [section]"
  echo ""
  echo "Sections:"
  echo "  pods            - Debug and troubleshoot pod-related issues"
  echo "  nodes           - Debug node-related issues"
  echo "  network         - Network troubleshooting"
  echo "  volumes         - Storage (PV, PVC) troubleshooting"
  echo "  jobs            - Debug jobs and cronjobs"
  echo "  ingress         - Debug ingress and service connectivity"
  echo "  security        - Security-related checks (CKS focus)"
  echo "  advanced        - Advanced tips and tools"
  echo "  yaml            - YAML formatting and validation tips"
  echo ""
  echo "Examples:"
  echo "  ./k8s_troubleshooting.sh pods"
  echo "  ./k8s_troubleshooting.sh advanced"
}

# =============================================
# Pods Troubleshooting
# =============================================
function pods_troubleshooting() {
  echo "=== Debugging Pods ==="
  
  # Comandi per troubleshooting dei pod
  echo "1. List pods with status and node:"
  kubectl get pods -o wide

  echo "2. Describe a problematic pod:"
  echo "kubectl describe pod <pod-name>"

  echo "3. Debug CrashLoopBackOff pods:"
  kubectl get pods | grep CrashLoopBackOff

  echo "4. Restart a crashing pod:"
  echo "kubectl delete pod <pod-name>"

  echo "5. Check logs for a specific pod:"
  echo "kubectl logs <pod-name>"

  echo "6. Execute a shell in a running pod:"
  echo "kubectl exec -it <pod-name> -- /bin/bash"

  # Comandi aggiuntivi per troubleshooting avanzato dei pod
  echo "7. List pod events:"
  kubectl get events --field-selector involvedObject.kind=Pod
  
  echo "8. Get logs from previous pod container:"
  kubectl logs <pod-name> --previous

  echo "9. Get logs from specific container inside pod:"
  kubectl logs <pod-name> -c <container-name>
}

# =============================================
# Nodes Troubleshooting
# =============================================
function nodes_troubleshooting() {
  echo "=== Debugging Nodes ==="
  
  # Comandi per troubleshooting dei nodi
  echo "1. List all nodes with statuses:"
  kubectl get nodes -o wide

  echo "2. Describe a specific node:"
  echo "kubectl describe node <node-name>"

  echo "3. Check for NotReady nodes:"
  kubectl get nodes | grep NotReady

  echo "4. Debug resources on a node:"
  kubectl top node <node-name>

  # Aggiungi controllo della situazione dei nodi
  echo "5. Check for node taints:"
  kubectl describe node <node-name> | grep Taints
}

# =============================================
# Network Troubleshooting
# =============================================
function network_troubleshooting() {
  echo "=== Debugging Network Issues ==="

  # Comandi per troubleshooting di rete
  echo "1. Test DNS resolution from a pod:"
  echo "kubectl run test-dns --rm -it --image=busybox -- nslookup <service-name>"

  echo "2. Test connectivity between pods:"
  echo "kubectl exec -it <pod-name> -- ping <target-pod-ip>"

  echo "3. Test service availability:"
  echo "kubectl exec -it <pod-name> -- curl http://<service-name>:<port>"

  # Aggiungi ulteriore debug di rete
  echo "4. Debug service DNS resolution:"
  echo "kubectl exec -it <pod-name> -- nslookup <service-name>"

  echo "5. Check if a service is exposing the correct ports:"
  kubectl describe svc <service-name>
}

# =============================================
# Storage Troubleshooting
# =============================================
function storage_troubleshooting() {
  echo "=== Debugging Storage Issues ==="
  
  # Comandi per troubleshooting dello storage
  echo "1. List PVCs and their statuses:"
  kubectl get pvc --all-namespaces

  echo "2. Describe a specific PVC:"
  echo "kubectl describe pvc <pvc-name>"

  echo "3. List PVs and their statuses:"
  kubectl get pv

  # Aggiungi troubleshooting su storage avanzato
  echo "4. Check for failed PVCs:"
  kubectl get pvc | grep Failed
  
  echo "5. Check persistent volume access modes:"
  kubectl describe pv <pv-name> | grep 'Access Modes'
}

# =============================================
# Jobs and CronJobs
# =============================================
function jobs_troubleshooting() {
  echo "=== Debugging Jobs and CronJobs ==="
  
  # Comandi per troubleshooting di Jobs e CronJobs
  echo "1. List all jobs:"
  kubectl get jobs

  echo "2. Describe a specific job:"
  echo "kubectl describe job <job-name>"

  echo "3. List all cronjobs:"
  kubectl get cronjob

  # Aggiungi controllo delle istanze di job
  echo "4. Get job logs:"
  kubectl logs -l job-name=<job-name> --all-containers=true
}

# =============================================
# Ingress and Services
# =============================================
function ingress_troubleshooting() {
  echo "=== Debugging Ingress and Services ==="
  
  # Comandi per troubleshooting di Ingress e servizi
  echo "1. List ingress resources:"
  kubectl get ingress --all-namespaces

  echo "2. Describe a specific ingress:"
  echo "kubectl describe ingress <ingress-name>"

  echo "3. Check logs of ingress controller:"
  echo "kubectl logs -n ingress-nginx <controller-pod-name>"

  # Aggiungi troubleshooting avanzato
  echo "4. Check service endpoints:"
  kubectl get endpoints <service-name>
}

# =============================================
# Security and Policies
# =============================================
function security_troubleshooting() {
  echo "=== Security and Policies ==="
  
  # Comandi per troubleshooting su sicurezza
  echo "1. List all Pod Security Policies (PSPs):"
  kubectl get psp --all-namespaces

  echo "2. Check for privileged containers:"
  kubectl get pods -o json | jq '.items[] | select(.spec.containers[].securityContext.privileged==true)'

  echo "3. Verify containers without securityContext:"
  kubectl get pods -o json | jq '.items[] | select(.spec.containers[].securityContext==null)'
}

# =============================================
# Advanced Tips and Tools
# =============================================
function advanced_tips() {
  echo "=== Advanced Tips and Tools ==="
  
  # Comandi avanzati e suggerimenti
  echo "1. Validate YAML configuration before applying:"
  echo "kubectl apply --dry-run=client -f <file.yaml>"

  echo "2. View detailed YAML of any resource:"
  echo "kubectl get <resource> <name> -o yaml"

  echo "3. Simulate application of a resource:"
  echo "kubectl apply --dry-run=server -f <file.yaml>"

  echo "4. Start a debug container on a node:"
  echo "kubectl debug node/<node-name> -it --image=busybox"
}

# =============================================
# YAML Formatting and Validation
# =============================================
function yaml_troubleshooting() {
  echo "=== YAML Troubleshooting and Tips ==="
  
  # Comandi per validazione YAML
  echo "1. Validate YAML syntax (locally):"
  echo "yaml-lint <file.yaml>"

  echo "2. Check indentation errors in YAML:"
  echo "kubectl apply -f <file.yaml> --dry-run=client"

  echo "3. Show which resource is defined in the YAML:"
  echo "kubectl apply -f <file.yaml> --dry-run=server"
}

# =============================================
# Main Logic
# =============================================
case $1 in
  pods)
    pods_troubleshooting
    ;;
  nodes)
    nodes_troubleshooting
    ;;
  network)
    network_troubleshooting
    ;;
  volumes)
    storage_troubleshooting
    ;;
  jobs)
    jobs_troubleshooting
    ;;
  ingress)
    ingress_troubleshooting
    ;;
  security)
    security_troubleshooting
    ;;
  advanced)
    advanced_tips
    ;;
  yaml)
    yaml_troubleshooting
    ;;
  *)
    show_help
    ;;
esac
