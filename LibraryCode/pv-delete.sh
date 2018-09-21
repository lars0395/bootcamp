#!/bin/bash

IFS=" "
pvs=$(kubectl get pv -o jsonpath='{.items.*.metadata.name}')
arr=($pvs)
for i in "${!arr[@]}"; do
    kubectl patch pv "${arr[$i]}" -p '{"spec": {"persistentVolumeReclaimPolicy": "Delete"}}'
done
unset IFS