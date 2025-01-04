

## Dashboard

```sh
kubectl port-forward -n sys deploy/traefik 8080:8080 & 
open http://localhost:8080/dashboard/#/http/routers
```


## Annotations

- https://doc.traefik.io/traefik/routing/providers/kubernetes-ingress/#on-service

Examples:
```yaml
traefik.ingress.kubernetes.io/router.enablePassTLSCert: "true"
traefik.ingress.kubernetes.io/router.disablePassHostHeaders: "true"

traefik.ingress.kubernetes.io/router.entrypoints: websecure #, websecure2
traefik.ingress.kubernetes.io/router.tls: "true"
traefik.ingress.kubernetes.io/preserve-host: "true"

# EXPOSE ON extra port
traefik.http.services.unifi.loadbalancer.server.port: 8443

traefik.http.services.unifi.loadbalancer.server.scheme: https
traefik.http.middlewares.unifi.redirectscheme.scheme: https


traefik.http.services.unifi.loadbalancer.server.scheme: https
traefik.http.middlewares.unifi.redirectscheme.scheme: https
```
