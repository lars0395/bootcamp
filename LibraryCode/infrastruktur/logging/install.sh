#!/bin/sh

helm install -f values-kubernetes-fluentd.yaml  kubernetes-fluentd --name kubernetes-fluentd

helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
helm install --name=curator --values=values-curator.yaml incubator/elasticsearch-curator
