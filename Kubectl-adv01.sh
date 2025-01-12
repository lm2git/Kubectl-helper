#!/bin/bash

# ============================================================
# Comandi aggiuntivi kubectl non inclusi nel primo script
# ============================================================

# -----------------------------------------------------------------------------
# Visualizzare e gestire le risorse
# -----------------------------------------------------------------------------

# Mostra l'output in formati personalizzati (wide, json, yaml)
echo "Visualizza risorse in formato wide:"
kubectl get pods -o wide

echo "Visualizza risorse in formato JSON:"
kubectl get pods -o json

echo "Visualizza risorse in formato YAML:"
kubectl get pods -o yaml

# Mostra risorse filtrando per label
echo "Filtra le risorse con una specifica etichetta:"
kubectl get pods -l app=<label-value>

# Mostra solo i nomi delle risorse
echo "Mostra solo i nomi delle risorse:"
kubectl get pods --no-headers -o custom-columns=":metadata.name"

# -----------------------------------------------------------------------------
# Gestione avanzata dei namespace
# -----------------------------------------------------------------------------

# Mostra le risorse in tutti i namespace
echo "Visualizza risorse in tutti i namespace:"
kubectl get pods --all-namespaces

# Mostra risorse per un namespace specifico
echo "Visualizza risorse in un namespace specifico:"
kubectl get pods -n <namespace-name>

# Elimina un namespace
echo "Elimina un namespace:"
kubectl delete namespace <namespace-name>

# -----------------------------------------------------------------------------
# Lavorare con ConfigMaps e Secrets avanzati
# -----------------------------------------------------------------------------

# Estrai dati specifici da un ConfigMap
echo "Estrai dati da un ConfigMap:"
kubectl get configmap <configmap-name> -o jsonpath='{.data.<key>}'

# Estrai dati specifici da un Secret
echo "Estrai dati da un Secret:"
kubectl get secret <secret-name> -o jsonpath='{.data.<key>}' | base64 --decode

# -----------------------------------------------------------------------------
# Debug e troubleshooting
# -----------------------------------------------------------------------------

# Mostra informazioni dettagliate su un nodo
echo "Visualizza informazioni dettagliate su un nodo:"
kubectl describe node <node-name>

# Debug di un pod con `kubectl debug`
echo "Debug di un pod con kubectl debug:"
kubectl debug pod/<pod-name> -it --image=busybox --target=<container-name>

# Crea una shell temporanea in un container di debug
echo "Crea una shell temporanea in un container di debug:"
kubectl run -i --tty debug --image=busybox --restart=Never -- sh

# -----------------------------------------------------------------------------
# Generazione YAML avanzata
# -----------------------------------------------------------------------------

# Genera YAML per creare un Job da un pod esistente
echo "Genera YAML per creare un Job da un pod esistente:"
kubectl create job <job-name> --from=pod/<pod-name> --dry-run=client -o yaml

# Genera YAML per un CronJob da un Job esistente
echo "Genera YAML per un CronJob da un Job esistente:"
kubectl create cronjob <cronjob-name> --schedule="0 0 * * *" --image=<image-name> --dry-run=client -o yaml

# -----------------------------------------------------------------------------
# Gestione delle risorse avanzata
# -----------------------------------------------------------------------------

# Ottieni eventi di un pod in tempo reale
echo "Monitora gli eventi in tempo reale per un pod:"
kubectl get events --field-selector=involvedObject.name=<pod-name> --watch

# Scarica un file da un container
echo "Scarica un file da un container in un pod:"
kubectl cp <pod-name>:<container-file-path> <local-destination-path>

# Carica un file in un container
echo "Carica un file in un container in un pod:"
kubectl cp <local-file-path> <pod-name>:<container-destination-path>

# -----------------------------------------------------------------------------
# Gestione delle risorse con comandi JSONPath
# -----------------------------------------------------------------------------

# Estrai indirizzi IP di tutti i pod
echo "Estrai gli indirizzi IP di tutti i pod:"
kubectl get pods -o jsonpath='{.items[*].status.podIP}'

# Estrarre nomi di tutti i nodi
echo "Estrai i nomi di tutti i nodi:"
kubectl get nodes -o jsonpath='{.items[*].metadata.name}'

# -----------------------------------------------------------------------------
# Utilizzo avanzato di rollout e rollback
# -----------------------------------------------------------------------------

# Pausa e ripresa del rollout di un deployment
echo "Pausa il rollout di un deployment:"
kubectl rollout pause deployment/<deployment-name>

echo "Riprendi il rollout di un deployment:"
kubectl rollout resume deployment/<deployment-name>

# Mostra la cronologia del rollout di un deployment
echo "Mostra la cronologia del rollout di un deployment:"
kubectl rollout history deployment/<deployment-name>

# -----------------------------------------------------------------------------
# Lavorare con le risorse di tipo Horizontal Pod Autoscaler (HPA)
# -----------------------------------------------------------------------------

# Visualizza gli HPA
echo "Visualizza gli HPA:"
kubectl get hpa

# Crea un HPA per un deployment
echo "Crea un HPA per un deployment:"
kubectl autoscale deployment <deployment-name> --cpu-percent=80 --min=1 --max=10

# -----------------------------------------------------------------------------
# Comandi per la pulizia
# -----------------------------------------------------------------------------

# Elimina i pod terminati
echo "Elimina i pod in stato 'Completed':"
kubectl delete pod --field-selector=status.phase==Succeeded

# Elimina le risorse orfane (senza owner reference)
echo "Trova ed elimina risorse orfane:"
kubectl get all --all-namespaces -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | .metadata.name' | xargs kubectl delete

# -----------------------------------------------------------------------------
# Fine
# -----------------------------------------------------------------------------
echo "Script completato. Tutti i comandi aggiuntivi sono stati eseguiti."
