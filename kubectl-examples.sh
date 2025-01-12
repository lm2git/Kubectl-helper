#!/bin/bash

# ===================================================================
#  kubectl commands: raggruppati per ogni tipo di oggetto Kubernetes
# ===================================================================

# -----------------------------------------------------------------------------
# Comandi generali di kubectl
# -----------------------------------------------------------------------------

# Visualizza la versione di Kubernetes
echo "Visualizza la versione di Kubernetes:"
kubectl version

# Visualizza informazioni sul cluster
echo "Visualizza informazioni sul cluster:"
kubectl cluster-info

# Mostra i contesti attivi e configurabili
echo "Visualizza tutti i contesti Kubernetes:"
kubectl config get-contexts

# Imposta un contesto specifico
echo "Imposta un contesto specifico:"
kubectl config use-context <context-name>

# Visualizza tutte le risorse nel cluster
echo "Visualizza tutte le risorse nel cluster:"
kubectl get all

# Ottenere informazioni generali su kubectl
echo "Visualizza l'help generale di kubectl:"
kubectl --help

# Ottenere aiuto per un comando specifico
echo "Visualizza l'help per un comando specifico (es. pod):"
kubectl help pod

# -----------------------------------------------------------------------------
# Lavorare con le API Versions
# -----------------------------------------------------------------------------

# Visualizza tutte le versioni delle API disponibili
echo "Visualizza tutte le versioni delle API disponibili:"
kubectl api-versions

# Controlla le versioni di un oggetto specifico (es. pod)
echo "Controlla la versione dell'API per un oggetto specifico (es. pod):"
kubectl explain pod --api-version=<api-version>

# Esplora le risorse specifiche in una versione dell'API
echo "Esplora una risorsa specifica in una versione dell'API:"
kubectl explain deployment.v1.apps

# -----------------------------------------------------------------------------
# Lavorare con i CRD (Custom Resource Definitions)
# -----------------------------------------------------------------------------

# Visualizza tutte le CRD (Custom Resource Definitions) presenti nel cluster
echo "Visualizza tutte le CRD nel cluster:"
kubectl get crds

# Descrivi una CRD specifica
echo "Descrivi una CRD specifica:"
kubectl describe crd <crd-name>

# Crea una CRD (Custom Resource Definition)
echo "Crea una CRD (Custom Resource Definition):"
kubectl apply -f <crd-definition-file>.yaml

# Elimina una CRD
echo "Elimina una CRD:"
kubectl delete crd <crd-name>

# -----------------------------------------------------------------------------
# Lavorare con le Custom Resources (CR)
# -----------------------------------------------------------------------------

# Visualizza una Custom Resource (CR) specifica per un CRD
echo "Visualizza una Custom Resource (CR) specifica:"
kubectl get <crd-name> <custom-resource-name>

# Crea una Custom Resource (CR) per una CRD
echo "Crea una Custom Resource (CR) per un CRD:"
kubectl apply -f <custom-resource-file>.yaml

# Descrivi una Custom Resource (CR)
echo "Descrivi una Custom Resource (CR):"
kubectl describe <crd-name> <custom-resource-name>

# Elimina una Custom Resource (CR)
echo "Elimina una Custom Resource (CR):"
kubectl delete <crd-name> <custom-resource-name>

# -----------------------------------------------------------------------------
# Lavorare con i pod
# -----------------------------------------------------------------------------

# Visualizza i pod nel cluster
echo "Visualizza i pod nel cluster:"
kubectl get pods

# Visualizza i dettagli di un pod specifico
echo "Descrivi un pod specifico:"
kubectl describe pod <pod-name>

# Visualizza i log di un pod
echo "Visualizza i log di un pod:"
kubectl logs <pod-name>

# Visualizza i log di un container specifico in un pod
echo "Visualizza i log di un container in un pod:"
kubectl logs <pod-name> -c <container-name>

# Visualizza i log di un pod in tempo reale
echo "Visualizza i log di un pod in tempo reale:"
kubectl logs -f <pod-name>

# Modifica un pod direttamente con kubectl edit
echo "Modifica un pod direttamente:"
kubectl edit pod <pod-name>

# Esegui un comando all’interno di un pod
echo "Esegui un comando all'interno di un pod:"
kubectl exec -it <pod-name> -- <command>

# -----------------------------------------------------------------------------
# Lavorare con i deployments
# -----------------------------------------------------------------------------

# Visualizza tutti i deployments
echo "Visualizza i deployments:"
kubectl get deployments

# Crea un deployment
echo "Crea un deployment con un'immagine specifica:"
kubectl create deployment <deployment-name> --image=<image-name>

# Scala un deployment (modifica il numero di repliche)
echo "Scala un deployment:"
kubectl scale deployment <deployment-name> --replicas=<num-replicas>

# Aggiorna un deployment con una nuova immagine
echo "Aggiorna un deployment con una nuova immagine:"
kubectl set image deployment/<deployment-name> <container-name>=<new-image-name>

# Rollback di un deployment
echo "Rollback di un deployment:"
kubectl rollout undo deployment/<deployment-name>

# Visualizza lo stato di un rollout di un deployment
echo "Visualizza lo stato del rollout:"
kubectl rollout status deployment/<deployment-name>

# -----------------------------------------------------------------------------
# Lavorare con i services
# -----------------------------------------------------------------------------

# Visualizza tutti i services
echo "Visualizza i services:"
kubectl get services

# Crea un service di tipo LoadBalancer
echo "Esporre un deployment come service di tipo LoadBalancer:"
kubectl expose deployment <deployment-name> --type=LoadBalancer --port=80 --target-port=8080

# Crea un service di tipo ClusterIP
echo "Crea un service di tipo ClusterIP:"
kubectl expose deployment <deployment-name> --type=ClusterIP --port=80 --target-port=8080

# Descrivi un service
echo "Descrivi un service:"
kubectl describe service <service-name>

# -----------------------------------------------------------------------------
# Lavorare con i namespaces
# -----------------------------------------------------------------------------

# Visualizza tutti i namespaces
echo "Visualizza tutti i namespaces:"
kubectl get namespaces

# Cambia il namespace corrente
echo "Cambia il namespace corrente:"
kubectl config set-context --current --namespace=<namespace-name>

# Crea un nuovo namespace
echo "Crea un nuovo namespace:"
kubectl create namespace <namespace-name>

# -----------------------------------------------------------------------------
# Lavorare con ConfigMaps
# -----------------------------------------------------------------------------

# Visualizza i configmaps
echo "Visualizza tutti i configmaps:"
kubectl get configmaps

# Crea un configmap da un file
echo "Crea un configmap da un file:"
kubectl create configmap <configmap-name> --from-file=<file-path>

# Descrivi un configmap
echo "Descrivi un configmap:"
kubectl describe configmap <configmap-name>

# -----------------------------------------------------------------------------
# Lavorare con i secrets
# -----------------------------------------------------------------------------

# Visualizza i secrets
echo "Visualizza tutti i secrets:"
kubectl get secrets

# Crea un secret da un file
echo "Crea un secret da un file:"
kubectl create secret generic <secret-name> --from-file=<file-path>

# Descrivi un secret
echo "Descrivi un secret:"
kubectl describe secret <secret-name>

# -----------------------------------------------------------------------------
# Lavorare con Persistent Volumes (PV) e Persistent Volume Claims (PVC)
# -----------------------------------------------------------------------------

# Visualizza i persistent volumes
echo "Visualizza i persistent volumes:"
kubectl get pv

# Visualizza i persistent volume claims
echo "Visualizza i persistent volume claims:"
kubectl get pvc

# Descrivi un PVC
echo "Descrivi un persistent volume claim:"
kubectl describe pvc <pvc-name>

# -----------------------------------------------------------------------------
# Lavorare con ReplicaSets
# -----------------------------------------------------------------------------

# Visualizza i replica sets
echo "Visualizza i replica sets:"
kubectl get replicasets

# Descrivi un replica set
echo "Descrivi un replica set:"
kubectl describe replicaset <replicaset-name>

# -----------------------------------------------------------------------------
# Lavorare con DaemonSets
# -----------------------------------------------------------------------------

# Visualizza i daemon sets
echo "Visualizza i daemon sets:"
kubectl get daemonsets

# -----------------------------------------------------------------------------
# Lavorare con Jobs e CronJobs
# -----------------------------------------------------------------------------

# Visualizza tutti i jobs
echo "Visualizza tutti i jobs:"
kubectl get jobs

# Visualizza tutti i cronjobs
echo "Visualizza tutti i cronjobs:"
kubectl get cronjobs

# Crea un cronjob
echo "Crea un cronjob:"
kubectl create cronjob <cronjob-name> --schedule="*/5 * * * *" --image=<image-name>

# -----------------------------------------------------------------------------
# Comandi avanzati per il debug
# -----------------------------------------------------------------------------

# Mostra eventi nel cluster
echo "Visualizza gli eventi recenti nel cluster (utile per il debug):"
kubectl get events --sort-by='.lastTimestamp'

# Trova un pod in stato "CrashLoopBackOff"
echo "Trova i pod in stato CrashLoopBackOff:"
kubectl get pods --field-selector=status.phase!=Running

# Descrivi i dettagli di un pod in stato di errore
echo "Descrivi un pod con errore (es. CrashLoopBackOff):"
kubectl describe pod <pod-name>

# Ottieni risorse in tempo reale (uso di top)
echo "Verifica l'utilizzo delle risorse nei nodi:"
kubectl top nodes

# Verifica l'utilizzo delle risorse nei pod
echo "Verifica l'utilizzo delle risorse nei pod:"
kubectl top pods

# -----------------------------------------------------------------------------
# Creazione YAML da kubectl
# -----------------------------------------------------------------------------

# Genera un file YAML di una risorsa (Deployment)
echo "Genera un file YAML per un deployment:"
kubectl get deployment <deployment-name> -o yaml

# Genera YAML per una risorsa con specifiche modificate
echo "Genera YAML per una risorsa modificata (es. scale un deployment):"
kubectl scale deployment <deployment-name> --replicas=5 --dry-run=client -o yaml

# Creazione di YAML da kubectl con un "dry-run"
echo "Crea un oggetto Kubernetes con dry-run e salva il file YAML:"
kubectl run <pod-name> --image=<image-name> --dry-run=client -o yaml > <file-name>.yaml

# -----------------------------------------------------------------------------
# Utilizzo avanzato
# -----------------------------------------------------------------------------

# Modifica una risorsa direttamente nel terminale
echo "Modifica una risorsa direttamente nel terminale:"
kubectl patch <resource> <name> -p '{"spec": {"replicas": 3}}'

# Simula l'applicazione senza modifiche effettive (dry-run)
echo "Simula l'applicazione senza modifiche effettive (dry-run):"
kubectl apply -f <file.yaml> --dry-run=client

# Filtra le risorse usando `grep`
echo "Filtra le risorse usando grep:"
kubectl get pods --no-headers | grep <pattern>

# -----------------------------------------------------------------------------
# Sicurezza e accessi
# -----------------------------------------------------------------------------

# Visualizza gli utenti del cluster
echo "Visualizza gli utenti del cluster:"
kubectl get users

# Modifica le autorizzazioni di accesso con Role e RoleBinding
echo "Creazione di un Role Binding:"
kubectl create rolebinding <role-binding-name> --role=<role-name> --user=<user-name> --namespace=<namespace-name>

# Visualizza i role bindings
echo "Visualizza tutti i role bindings:"
kubectl get rolebindings --namespace=<namespace-name>

# -----------------------------------------------------------------------------
# Fine
# ----------------------------------------------------------------------------
