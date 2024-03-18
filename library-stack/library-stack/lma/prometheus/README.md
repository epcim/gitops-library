

# Upgrades

- Delete CRDs, https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack#upgrading-chart
```
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheusagents.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd scrapeconfigs.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
```

# Issues

## metadata.annotations: Too long
- https://github.com/prometheus-community/helm-charts/issues/1500
```
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.56.0/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml --force-conflicts=true --server-side
```

