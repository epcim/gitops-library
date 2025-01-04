#!/bin/bash -xe

JB="$(which sjsonnet 2> /dev/null || which jsonnet 2> /dev/null)"

if [ -z "${JB}" ]; then
	echo "jsonnet builder not found"
	exit 1
fi

echo "Using jsonnet builder ${JB}"

mkdir -p mon/generated/grafana mon/generated/prometheus

{JB} -J mon/vendor -m mon/generated/grafana mon/grafana.jsonnet
${JB} -J mon/vendor -m mon/generated/prometheus mon/prometheus.jsonnet
