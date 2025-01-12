# Kubernetes Kubectl-helper a Command Helper Script

This repository contains a helper script for Kubernetes command-line operations. It is designed to provide a quick reference for managing resources in a Kubernetes cluster.

The script offers an interactive menu with several sections, including pod management, deployments, services, CRDs, network troubleshooting, debugging, security, and more. Each section provides common commands and usage examples, making it a great resource for both beginners and experienced Kubernetes users.

## Features

- Interactive menu-driven commands for Kubernetes operations.
- Includes commands for:
  - Working with **Pods**, **Deployments**, **Services**, **Namespaces**, **ConfigMaps**, **Secrets**, **Persistent Volumes**, **CronJobs**, **Jobs**, **ReplicaSets**, and **DaemonSets**.
  - Advanced **debugging**, **YAML generation**, and **security and access management**.
  - **Cluster status**, **resource usage**, and **network troubleshooting**.

  
## Requirements

- Kubernetes CLI (`kubectl`) installed and configured to interact with your cluster.
- Bash shell (the script is written in Bash).
  
## How to Use

1. Clone the repository:
    ```bash
    git clone https://github.com/lm2git/kubernetes-helper.git
    cd kubernetes-helper
    ```

2. Make the script executable:
    ```bash
    chmod +x kubernetes-helper.sh
    ```

3. Run the script:
    ```bash
    ./kubernetes-helper.sh
    ```

4. Use the interactive menu to choose the section you want to explore. The script will display a set of commands and examples for that section.

5. To exit, simply select the option `0` to quit the script.

## Menu Sections

The script includes the following sections:

1. **Work with API Versions**: Check available API versions, explain resources in a specific version.
2. **Manage CRDs**: List, create, and manage Custom Resource Definitions.
3. **Handle Pods**: View pod details, logs, execute commands inside pods, and more.
4. **Manage Deployments**: Commands for creating, scaling, updating, and rolling back deployments.
5. **Work with Services**: Create and manage Kubernetes services.
6. **Namespace Operations**: Work with namespaces, including switching between namespaces.
7. **ConfigMaps and Secrets**: Create and manage ConfigMaps and Secrets.
8. **Persistent Volumes and Claims**: Work with persistent storage in Kubernetes.
9. **ReplicaSets and DaemonSets**: Work with ReplicaSets and DaemonSets.
10. **Jobs and CronJobs**: Create and manage Jobs and CronJobs.
11. **Advanced Debugging**: Get logs, debug pods, and investigate resource usage.
12. **YAML Generation and Editing**: Generate and edit YAML files for Kubernetes resources.
13. **Advanced Usage**: Learn advanced techniques like patching, simulating changes, and filtering resources.
14. **Security and Access Management**: Manage RBAC, service accounts, and roles.
15. **Miscellaneous Commands**: Quick access to cluster information and other useful commands.
16. **Cluster Status and General Information**: View status of the cluster, nodes, and pods.
17. **Resource Problem Identification**: Diagnose issues with resources and pods.
18. **Node Analysis and Troubleshooting**: Investigate node health and issues.
19. **Network Troubleshooting**: Troubleshoot networking issues, such as DNS and service access.
20. **Resource Utilization Verification**: Check CPU, memory, and network usage in your cluster.
21. **Rollout and Update Troubleshooting**: Troubleshoot and manage rollouts and updates.
22. **Events and Diagnostics**: View and analyze cluster events for troubleshooting.

## Example

After running the script, you can navigate the menu to view commands for a particular task. For example, selecting `3` (Handle Pods) will show commands like:

```bash
# List all pods in the cluster
kubectl get pods

# Describe a specific pod
kubectl describe pod <pod-name>

# Get logs from a pod
kubectl logs <pod-name>

# Follow logs of a pod in real-time
kubectl logs -f <pod-name>
```
