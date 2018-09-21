# Deploy fluentd using helm

## Deploying Fluentd

Please have a look at `./values.yaml` and adjust the values if necessary. For fine grained adjustments to the kubernetes config files, please review the files in './templates' sub folder.

Once finished, make sure kubectl is configured to the desired cluster.

```bash
kubectl config use-context {DEV|PROD}
```

```bash
export TAG=<image-tag>
helm --tiller-namespace kube-system install --set image.tag=${TAG} --name=fluentd --set stage={dev|prod} .
```

where stage needs to be either 'dev' or 'prod' depending on where you want to create the app.
For deployment, execute:

```bash
export TAG=<image-tag, e.g. prod-release>
helm --tiller-namespace kube-system upgrade --recreate-pods --set image.tag=${TAG} --set stage={dev|prod} fluentd .
for p in `kubectl -n kube-system get pods --no-headers -l k8s-app=fluentd|cut -f1 -d" "`; do kubectl delete pod $p; done
```

In order to delete this app from kubernetes, run:

```bash
helm --tiller-namespace kube-system delete --purge fluentd
```