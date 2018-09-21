#!/bin/sh

# Kube Prometheus
helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
helm install coreos/prometheus-operator --name prometheus-operator
helm install coreos/kube-prometheus --name kube-prometheus --values=values-kube-prometheus.yaml
