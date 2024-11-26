sudo kubeadm init

mkdir -p /home/azureuser/.kube

sudo cp -i /etc/kubernetes/admin.conf /home/azureuser/.kube/config

sudo chown $(id -u):$(id -g) /home/azureuser/.kube/config

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

echo '#!/bin/bash' > token.sh

kubeadm token create --print-join-command >> token.sh
