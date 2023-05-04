function clear_aggregator_cache() {
  ssh stg-k8s "kubectl -n solaris get pod | \
        grep aggregator-deployment | \
        awk '{print \$1}' | \
        xargs -I{} kubectl -n solaris exec {} -c aggregator -- curl -s http://localhost:22400/agg_plus/system-admin/cache/clear"
}
