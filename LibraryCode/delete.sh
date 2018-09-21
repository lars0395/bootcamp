#!/bin/bash

helm delete --purge kube-prometheus
helm delete --purge kubernetes-fluentd
helm delete --purge curator
helm delete --purge prometheus-operator

kubectl delete ns operators
kubectl delete ns bibliothek