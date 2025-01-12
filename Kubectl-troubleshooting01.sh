#!/bin/bash

# ============================================================
# Kubernetes Troubleshooting: Comandi di riferimento completo
# ============================================================

echo "Inizio troubleshooting Kubernetes..."

# -----------------------------------------------------------------------------
# 1. Stato generale del cluster
# -----------------------------------------------------------------------------

echo "Visualizza lo stato del cluster:"
kubectl cluster-info

echo "Visualizza i nodi del cluster:"
kubectl get nodes -o wide

echo "Verifica lo stato dei componenti del cluster:"
kubectl get componentstatuses

echo "Controlla la versione di Kubernetes:"
kubectl version --short

# -----------------------------------------------------------------------------
# 2. Identificazione delle risorse problematiche
# -----------------------------------------------------------------------------

echo "Visualizza lo stato di tutte le risorse nel namespace corrente:"
kubectl get all

echo "Visualizza lo stato di tutte le risorse in un namespace specifico:"
kubectl get all -n <namespace-name>

echo "Elenca tutte le risorse di tutti i namespace:"
kubectl get all --all-namespaces

echo "Elenca tutte le risorse filtrando per label:"
kubectl get pods -l <label-key>=<label-value>

# -----------------------------------------------------------------------------
# 3. Debug e ispezione dei pod
# -----------------------------------------------------------------------------

echo "Visualizza lo stato dei pod:"
kubectl get pods -o wide

echo "Ispeziona un pod specifico:"
kubectl describe pod <pod-name>

echo "Controlla i log di un container in un pod:"
kubectl logs <pod-name> -c <container-name>

echo "Controlla i log dei pod in un namespace specifico:"
kubectl logs -n <namespace-name> <pod-name>

echo "Controlla i log in tempo reale (streaming):"
kubectl logs -f <pod-name>

echo "Esegui un comando all'interno di un container:"
kubectl exec -it <pod-name> -c <container-name> -- <command>

echo "Debug con un container temporaneo:"
kubectl debug pod/<pod-name> -it --image=busybox

# -----------------------------------------------------------------------------
# 4. Analisi e risoluzione di problemi con i nodi
# -----------------------------------------------------------------------------

echo "Visualizza lo stato dei nodi:"
kubectl get nodes -o wide

echo "Ispeziona un nodo specifico:"
kubectl describe node <node-name>

echo "Controlla le risorse disponibili sui nodi:"
kubectl top nodes

echo "Controlla i pod in esecuzione su un nodo specifico:"
kubectl get pods --field-selector=spec.nodeName=<node-name> -o wide

# -----------------------------------------------------------------------------
# 5. Eventi e diagnosi
# -----------------------------------------------------------------------------

echo "Visualizza gli eventi del cluster:"
kubectl get events --sort-by='.metadata.creationTimestamp'

echo "Visualizza eventi correlati a una risorsa specifica:"
kubectl describe <resource-type> <resource-name>

echo "Filtra eventi per tipo di risorsa:"
kubectl get events --field-selector=involvedObject.kind=<resource-type>

# -----------------------------------------------------------------------------
# 6. Risoluzione problemi di rete
# -----------------------------------------------------------------------------

echo "Controlla i servizi disponibili:"
kubectl get services -o wide

echo "Ispeziona un servizio specifico:"
kubectl describe service <service-name>

echo "Testa la connettività tra i pod con comandi curl o ping:"
kubectl exec -it <pod-name> -- curl http://<service-ip>:<port>

echo "Mostra endpoint associati a un servizio:"
kubectl get endpoints <service-name>

echo "Visualizza il routing delle richieste Ingress:"
kubectl get ingress -o wide

echo "Ispeziona un Ingress specifico:"
kubectl describe ingress <ingress-name>

# -----------------------------------------------------------------------------
# 7. Verifica utilizzo delle risorse (CPU, RAM)
# -----------------------------------------------------------------------------

echo "Monitora l'utilizzo delle risorse dei nodi:"
kubectl top nodes

echo "Monitora l'utilizzo delle risorse dei pod:"
kubectl top pods -n <namespace-name>

echo "Mostra limiti e richieste di risorse per i pod:"
kubectl get pods -o custom-columns="NAME:.metadata.name,CPU_REQUEST:.spec.containers[*].resources.requests.cpu,CPU_LIMIT:.spec.containers[*].resources.limits.cpu"

# -----------------------------------------------------------------------------
# 8. Risoluzione di problemi con i rollout e aggiornamenti
# -----------------------------------------------------------------------------

echo "Controlla lo stato di un deployment:"
kubectl rollout status deployment/<deployment-name>

echo "Mostra la cronologia del rollout di un deployment:"
kubectl rollout history deployment/<deployment-name>

echo "Esegui il rollback di un deployment a una versione precedente:"
kubectl rollout undo deployment/<deployment-name> --to-revision=<revision-number>

echo "Pausa e riprendi un rollout:"
kubectl rollout pause deployment/<deployment-name>
kubectl rollout resume deployment/<deployment-name>

# -----------------------------------------------------------------------------
# 9. Verifica di ConfigMaps e Secrets
# -----------------------------------------------------------------------------

echo "Visualizza i ConfigMaps disponibili:"
kubectl get configmaps -n <namespace-name>

echo "Ispeziona un ConfigMap specifico:"
kubectl describe configmap <configmap-name>

echo "Visualizza i Secrets disponibili:"
kubectl get secrets -n <namespace-name>

echo "Ispeziona un Secret specifico (decodifica base64 manualmente):"
kubectl get secret <secret-name> -o jsonpath='{.data.<key>}' | base64 --decode

# -----------------------------------------------------------------------------
# 10. Pulizia e gestione delle risorse
# -----------------------------------------------------------------------------

echo "Elimina pod in stato 'Completed':"
kubectl delete pod --field-selector=status.phase==Succeeded

echo "Elimina risorse orfane:"
kubectl get all --all-namespaces -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | .metadata.name' | xargs kubectl delete

echo "Rimuovi un namespace con tutte le risorse associate:"
kubectl delete namespace <namespace-name>

# -----------------------------------------------------------------------------
# 11. Backup e restore
# -----------------------------------------------------------------------------

echo "Effettua un backup delle risorse in formato YAML:"
kubectl get all -n <namespace-name> -o yaml > backup-<namespace-name>.yaml

echo "Ripristina risorse da un file YAML:"
kubectl apply -f backup-<namespace-name>.yaml

# -----------------------------------------------------------------------------
# Fine
# -----------------------------------------------------------------------------

echo "Troubleshooting completato. Consulta i risultati dei comandi per ulteriori dettagli."
