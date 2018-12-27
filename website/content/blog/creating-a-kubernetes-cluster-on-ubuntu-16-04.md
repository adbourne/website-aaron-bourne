---
title: "Creating a Kubernetes Cluster on Ubuntu 16.04"
type: post 
date: 2017-12-12T00:00:00Z
categories: ["Computer Science", "Distributed Computing", "Tutorials"] 
tags: ["Cluster Computing", "Dnsmasq", "Docker", "Flannel", "Flanneld", "K8s", "Kubernetes", "Linux", "Tutorial", "Ubuntu", "Ubuntu 16.04"] 
draft: false
featured_image: "img/kubernetes/kubernetes-logo.png"
aliases:
    - "/2017/12/12/creating-a-kubernetes-cluster-on-ubuntu-16-04/"
---

[Kubernetes](https://kubernetes.io/) is a truly fantastic piece of software. Through an array of well 
thought-out abstractions, Kubernetes gives the Developer a mechanism to deploy, manage and scale containerised 
applications. In this article I'll talk you through installing a Kubernetes cluster, suitable for development 
(not production!), on a few re-purposed machines.

Disclaimer: These are the steps that worked for me, your milage may vary.

### The Hardware
I managed to get hold of three second-hand Dell machines. Each identical, the specs looked a bit like this:

    Memory: 8GB DDR2

    CPU: Intel 3GHz Core 2 Duo  

    Disk: 1TB

From what I have read, Kubernetes is pretty versatile. There's nothing to say you need specs identical to the above, but 
these worked pretty well for me!

In addition to this and my local machine, I needed a switch, some CAT 5 cables and a Raspberry Pi running 
[dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) as a DNS server (because typing out IP addresses can get 
tedious).

The network configuration went a bit like this:

    1. Plug everything into the switch using the CAT 5s
    2. Tinker with dnsmasq until you're happy
    

### Installing Ubuntu Server 16.04
There's a whole bunch of guides out there on how to best install Ubuntu Server, so I won't cover that here. Instead, 
[why not take a look at this guide](http://landoflinux.com/linux_install_ubuntu_server_1604.html).

When installing, remember to install OpenSSH server! You'll need this to SSH into the boxes.

### Installing Kubernetes - On Each Node
The following steps assume you are shelled into the box and have the required sudo access. They should be repeated on 
each node you are installing Kubernetes onto.

Kubernetes does not like swap, so disable it if your Ubuntu installation has configured it:
```
# First, look in /etc/fstab for your swap file 
# Mine was "/dev/mapper/node1--vg-swap_1"
# I'll refer to this path as "MY_SWAP_PATH"

# Disable swap
sudo swapoff $MY_SWAP_PATH

# Comment out the swap line in /etc/fstab
sudo vi /etc/fstab

# Restart the node
sudo reboot now
```

Update apt-get caches:
```
sudo apt-get update
```

Install dependencies for TLS:
```
sudo apt-get install -y apt-transport-https
```

Install Docker:
```
# Installs Docker
sudo apt-get install -y docker.io

# Starts Docker
sudo systemctl start Docker

# Starts Docker on boot etc
sudo systemctl enable docker
```

Install Kubernetes:
```
# Add the Kubernetes repo key 
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Edit the following file
sudo vi /etc/apt/sources.list.d/kubernetes.list 
# Add this line:
deb http://apt.kubernetes.io/ kubernetes-xenial main 

# Update dependencies
sudo apt-get update

# Install the necessary Kubernetes components
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
```

### Installing Kubernetes - On The Master Node
The follow steps needs to take place on just the master node. This can be any one node. Choose your favourite.

Use Kubeadm to initialise a Kubernetes cluster:
```
# The pod-network-cidr flag is required in order to use Flannel
# What's a Flannel? You'll see.
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

Once kubeadm has done its thing, you will be given some instructions to run on each non-master node. Go ahead and do 
this now.

### Enable Pod-to-pod Networking
Kubernetes does not support pod-to-pod networking out of the box. Install [Flannel](https://github.com/coreos/flannel) 
to take care of the networking:

```
# Run the following on the master node
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

### Loosen-up Pod Restrictions on the Master Node
By default, Kubernetes will not run non-system specific pods (like your apps) on the master node. It could be argued 
that it's a little restrictive on a development cluster. Run the following on the master node to allow your pods to 
run on it:

```
# "Untaint" the master node so things can run on it (probs not ok in production)
kubectl taint nodes --all node-role.kubernetes.io/master-
```

### Deploy the Kubernetes Dashboard
The Kubernetes Dashboard is awesome. Run the following on any node to deploy it:

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

Later versions of the dashboard use [RBAC](https://kubernetes.io/docs/admin/authorization/rbac/) by default. I decided 
to switch this off on my development cluster, to making access easier. I wouldn't recommend doing so in production 
though. Look here for [full instructions on why and how to do so](https://github.com/kubernetes/dashboard/wiki/Access-control).

TL;DR:
```
# Create a file with this content on your master node
# Perhaps in /tmp/dashboard-admin.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: kubernetes-dashboard
  labels:
    k8s-app: kubernetes-dashboard
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: kubernetes-dashboard
  namespace: kube-system

# Apply the file
kubectl apply -f /tmp/dashboard-admin.yaml

# You can now skip the option to login to the dashboard
```

### Accessing your Cluster "Remotely"
You will likely want to access your cluster using kubectl "remotely", that is, through a machine connected to the same 
internal network. Information on how to do this can be found here. TL;DR:

```
# Make sure you have kubectl installed
# On a Mac you can install it with brew
brew install kubectl

# SSH into the master node
# Copy the following file on the master node
~/.kube/config
# To the following place on your machine
~/.kube/config

# Try using kubectl to query your cluster from your machine:
kubectl get namespaces

# Access the Kubernetes Dashboard by running this on your local machine:
kubectl proxy

# Then hit the following URL in your browser
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```

### Conclusion
With a little luck, you should now have a Kubernetes cluster up and running! The Kubernetes documentation should be 
your next stop. Have fun!