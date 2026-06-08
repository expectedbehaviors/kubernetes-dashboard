#!/usr/bin/env bash
# Upstream kubernetes.github.io/dashboard Helm repo 404s after project archive.
# Fetch the pinned release tarball from kubernetes-retired/dashboard instead.
set -euo pipefail

chartRoot="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "${chartRoot}/charts"
curl -fsSL \
  -o "${chartRoot}/charts/kubernetes-dashboard-7.10.0.tgz" \
  "https://github.com/kubernetes-retired/dashboard/releases/download/kubernetes-dashboard-7.10.0/kubernetes-dashboard-7.10.0.tgz"
echo "Fetched kubernetes-dashboard-7.10.0.tgz"
