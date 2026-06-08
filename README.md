# Kubernetes Dashboard Helm Chart

Baseline Helm chart for the [Kubernetes Dashboard](https://github.com/kubernetes/dashboard). Wraps the official upstream chart and optionally creates an `admin-user` ServiceAccount with cluster-admin for token auth.

## Subcharts

| Subchart | Source | Values prefix | Description |
|----------|--------|---------------|-------------|
| **dashboard** (kubernetes-dashboard) | [kubernetes.github.io/dashboard](https://kubernetes.github.io/dashboard) | `dashboard.*` | Dashboard UI, ingress, API settings. |

## Templates

- **authentication.yaml** — `admin-user` ServiceAccount, ClusterRoleBinding, and token Secret.

## Configuration

Override ingress hosts, `dashboard.app.settings.global.clusterName`, and `--enable-skip-login` when fronting with OIDC/oauth2-proxy.

## Archived upstream dependency

The official Kubernetes Dashboard Helm repository no longer serves `index.yaml`. Before lint, template, or package, fetch the pinned upstream chart:

```bash
bash scripts/fetch-upstream-dependency.sh
helm template release . -f values.yaml -n cluster-tools
```

CI runs the same fetch step automatically.
