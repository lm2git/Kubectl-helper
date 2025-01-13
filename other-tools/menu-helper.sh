#!/bin/bash

# Script: kubectl-full-menu.sh
# Descrizione: Menu interattivo con una lista completa di comandi kubectl, organizzati per categoria.
# Utilizzo: Esegui questo script e seleziona una categoria per visualizzare i comandi utili.

function show_basic_commands() {
    echo "=== Comandi di Base ==="
    echo "# Visualizzare le risorse:"
    echo "kubectl get pods"
    echo "kubectl get services"
    echo "kubectl get deployments"
    echo "kubectl get replicasets"
    echo "kubectl get statefulsets"
    echo "kubectl get daemonsets"
    echo "kubectl get jobs"
    echo "kubectl get cronjobs"
    echo "kubectl get nodes"
    echo "kubectl get namespaces"
    echo "kubectl get configmaps"
    echo "kubectl get secrets"
    echo "kubectl get pv  # Persistent Volumes"
    echo "kubectl get pvc  # Persistent Volume Claims"
    echo "kubectl get endpoints"
    echo "kubectl get ingress"
    echo "kubectl get serviceaccounts"
    echo "kubectl get roles"
    echo "kubectl get rolebindings"
    echo "kubectl get clusterroles"
    echo "kubectl get clusterrolebindings"
    echo "kubectl get networkpolicies"
    echo "kubectl get poddisruptionbudgets"
    echo

    echo "# Descrivere le risorse:"
    echo "kubectl describe pod <pod-name>"
    echo "kubectl describe service <service-name>"
    echo "kubectl describe deployment <deployment-name>"
    echo "kubectl describe node <node-name>"
    echo "kubectl describe namespace <namespace-name>"
    echo "kubectl describe configmap <configmap-name>"
    echo "kubectl describe secret <secret-name>"
    echo "kubectl describe pv <pv-name>"
    echo "kubectl describe pvc <pvc-name>"
    echo

    echo "# Creare risorse:"
    echo "kubectl create deployment <deployment-name> --image=<image-name>"
    echo "kubectl create namespace <namespace-name>"
    echo "kubectl create configmap <configmap-name> --from-literal=<key>=<value>"
    echo "kubectl create secret generic <secret-name> --from-literal=<key>=<value>"
    echo "kubectl create service clusterip <service-name> --tcp=<port>"
    echo "kubectl create service nodeport <service-name> --tcp=<port>"
    echo "kubectl create service loadbalancer <service-name> --tcp=<port>"
    echo "kubectl create job <job-name> --image=<image-name>"
    echo "kubectl create cronjob <cronjob-name> --image=<image-name> --schedule='*/1 * * * *'"
    echo

    echo "# Eliminare risorse:"
    echo "kubectl delete pod <pod-name>"
    echo "kubectl delete service <service-name>"
    echo "kubectl delete deployment <deployment-name>"
    echo "kubectl delete namespace <namespace-name>"
    echo "kubectl delete configmap <configmap-name>"
    echo "kubectl delete secret <secret-name>"
    echo "kubectl delete pv <pv-name>"
    echo "kubectl delete pvc <pvc-name>"
    echo
}

function show_advanced_commands() {
    echo "=== Comandi Avanzati ==="
    echo "# Modificare risorse esistenti:"
    echo "kubectl edit pod <pod-name>"
    echo "kubectl edit deployment <deployment-name>"
    echo "kubectl edit service <service-name>"
    echo "kubectl edit configmap <configmap-name>"
    echo "kubectl edit secret <secret-name>"
    echo

    echo "# Scalare i deployment:"
    echo "kubectl scale deployment <deployment-name> --replicas=<number>"
    echo

    echo "# Eseguire comandi all'interno di un pod:"
    echo "kubectl exec -it <pod-name> -- /bin/sh"
    echo

    echo "# Log dei pod:"
    echo "kubectl logs <pod-name>"
    echo "kubectl logs -f <pod-name>  # Streaming dei log"
    echo "kubectl logs <pod-name> -c <container-name>  # Log di un container specifico"
    echo

    echo "# Port forwarding:"
    echo "kubectl port-forward <pod-name> <local-port>:<pod-port>"
    echo

    echo "# Applicare file YAML:"
    echo "kubectl apply -f <file.yaml>"
    echo "kubectl delete -f <file.yaml>"
    echo

    echo "# Rollout e rollback:"
    echo "kubectl rollout status deployment/<deployment-name>"
    echo "kubectl rollout history deployment/<deployment-name>"
    echo "kubectl rollout undo deployment/<deployment-name>"
    echo

    echo "# Gestione delle configurazioni:"
    echo "kubectl set image deployment/<deployment-name> <container-name>=<new-image>"
    echo "kubectl set env deployment/<deployment-name> <key>=<value>"
    echo "kubectl set resources deployment/<deployment-name> --limits=cpu=<value>,memory=<value>"
    echo
}

function show_security_commands() {
    echo "=== Comandi per la Sicurezza (CKS) ==="
    echo "# Creare un Secret:"
    echo "kubectl create secret generic <secret-name> --from-literal=<key>=<value>"
    echo "kubectl create secret tls <secret-name> --cert=<cert-file> --key=<key-file>"
    echo

    echo "# Creare un ConfigMap:"
    echo "kubectl create configmap <configmap-name> --from-literal=<key>=<value>"
    echo "kubectl create configmap <configmap-name> --from-file=<file>"
    echo

    echo "# Network Policies:"
    echo "kubectl apply -f network-policy.yaml"
    echo

    echo "# Controllare i ruoli e le autorizzazioni:"
    echo "kubectl get roles"
    echo "kubectl get rolebindings"
    echo "kubectl get clusterroles"
    echo "kubectl get clusterrolebindings"
    echo "kubectl auth can-i <verb> <resource>"
    echo

    echo "# Gestione dei Service Accounts:"
    echo "kubectl create serviceaccount <serviceaccount-name>"
    echo "kubectl get serviceaccounts"
    echo "kubectl describe serviceaccount <serviceaccount-name>"
    echo
}

function show_storage_commands() {
    echo "=== Comandi per la Gestione dei Volumi ==="
    echo "# Creare un Persistent Volume (PV):"
    echo "kubectl apply -f pv.yaml"
    echo

    echo "# Creare un Persistent Volume Claim (PVC):"
    echo "kubectl apply -f pvc.yaml"
    echo

    echo "# Visualizzare PV e PVC:"
    echo "kubectl get pv"
    echo "kubectl get pvc"
    echo

    echo "# Gestione degli StorageClass:"
    echo "kubectl get storageclasses"
    echo "kubectl describe storageclass <storageclass-name>"
    echo
}

function show_debugging_commands() {
    echo "=== Comandi per il Debugging ==="
    echo "# Controllare gli eventi:"
    echo "kubectl get events"
    echo

    echo "# Controllare lo stato dei nodi:"
    echo "kubectl describe node <node-name>"
    echo

    echo "# Controllare lo stato dei pod:"
    echo "kubectl describe pod <pod-name>"
    echo

    echo "# Controllare lo stato dei servizi:"
    echo "kubectl describe service <service-name>"
    echo

    echo "# Controllare le metriche delle risorse:"
    echo "kubectl top nodes"
    echo "kubectl top pods"
    echo
}

function show_cluster_commands() {
    echo "=== Comandi per la Gestione dei Cluster ==="
    echo "# Controllare lo stato del cluster:"
    echo "kubectl cluster-info"
    echo

    echo "# Controllare la configurazione del cluster:"
    echo "kubectl config view"
    echo "kubectl config use-context <context-name>"
    echo "kubectl config set-context <context-name> --cluster=<cluster-name> --user=<user-name>"
    echo

    echo "# Controllare i componenti del cluster:"
    echo "kubectl get componentstatuses"
    echo

    echo "# Gestione dei nodi:"
    echo "kubectl cordon <node-name>"
    echo "kubectl uncordon <node-name>"
    echo "kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data"
    echo
}

# Menu principale
while true; do
    echo "=== Menu Kubectl Comandi ==="
    echo "1. Comandi di Base"
    echo "2. Comandi Avanzati"
    echo "3. Comandi per la Sicurezza (CKS)"
    echo "4. Comandi per la Gestione dei Volumi"
    echo "5. Comandi per il Debugging"
    echo "6. Comandi per la Gestione dei Cluster"
    echo "0. Esci"
    echo

    read -p "Seleziona una categoria (0-6): " choice
    echo

    case $choice in
        1) show_basic_commands ;;
        2) show_advanced_commands ;;
        3) show_security_commands ;;
        4) show_storage_commands ;;
        5) show_debugging_commands ;;
        6) show_cluster_commands ;;
        0) echo "Uscita dal menu."; break ;;
        *) echo "Scelta non valida. Riprova." ;;
    esac

    echo
    read -p "Premi Invio per continuare..."
    echo
done
