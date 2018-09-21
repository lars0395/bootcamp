#!/bin/bash

# creating namepaces
kubectl create ns bibliothek
#kubectl create ns operators



####################################################
# subsequents calls are going to namespace operators
#kns operators

# install ElasticSearch Operator
#kubectl apply -f infrastruktur/es-operator/operator.yaml



#####################################################
# subsequents calls are going to namespace bibliothek
kns bibliothek

# install monitoring
(cd infrastruktur/monitoring; ./install.sh)
kubectl apply -f infrastruktur/monitoring/service-monitor-rook.yaml

# install logging
kubectl apply -f infrastruktur/logging/es-log-cluster.yaml
(cd infrastruktur/logging; ./install.sh)
kubectl apply -f infrastruktur/logging/kibana.yaml

# install tracing
kubectl apply -f infrastruktur/tracing/.

# install service persistence
kubectl apply -f infrastruktur/mongodb/mongo-deploy.yaml
kubectl apply -f infrastruktur/postgres-simple/deploy.yaml



#####################################################
# install application

(cd assets; docker build --no-cache -t containerbootcamp/assets . ; docker push containerbootcamp/assets)

kubectl apply -f assets/assets-deploy.yaml
kubectl apply -f ausleihen/kube-deploy.yaml
kubectl apply -f einbuchen/kube-deploy.yaml
kubectl apply -f reservieren/kube-deploy.yaml
kubectl apply -f suchen/.