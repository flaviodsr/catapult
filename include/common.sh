#!/bin/bash

export DEBUG_MODE="${DEBUG_MODE:-false}"
source $ROOT_DIR/include/func.sh

debug_mode

export VALUES_OVERRIDE="${VALUES_OVERRIDE:-}"
OVERRIDE=
if [ -n "$VALUES_OVERRIDE" ] && [ -f "$VALUES_OVERRIDE" ]; then
  OVERRIDE=$(cat $VALUES_OVERRIDE)
fi

export CLUSTER_NAME=${CLUSTER_NAME:-$BACKEND}
#export ROOT_DIR="$(git rev-parse --show-toplevel)"
export BUILD_DIR="$ROOT_DIR"/build${CLUSTER_NAME}

# Forces our build context
[ -d "$BUILD_DIR" ] && pushd "$BUILD_DIR"

export CHART_URL="${CHART_URL:-}" # FIXME deprecated, used in SCF_CHART
export SCF_CHART="${SCF_CHART:-CHART_URL}"
export STRATOS_CHART="${STRATOS_CHART:-}"
export SCF_REPO="${SCF_REPO:-https://github.com/SUSE/scf}"
export SCF_BRANCH="${SCF_BRANCH:-develop}"

export KIND_VERSION="${KIND_VERSION:-0.2.1}"
export HA="${HA:-false}"
export SIZING="${SIZING:-1}"
export DOCKER_REGISTRY="${DOCKER_REGISTRY:-registry.suse.com}"
export DOCKER_ORG="${DOCKER_ORG:-cap}"
set +x
export DOCKER_USERNAME="${DOCKER_USERNAME:-}"
export DOCKER_PASSWORD="${DOCKER_PASSWORD:-}"
export CLUSTER_PASSWORD="${CLUSTER_PASSWORD:-password}"

export ENABLE_EIRINI="${ENABLE_EIRINI:-true}"
export EMBEDDED_UAA="${EMBEDDED_UAA:-false}"
export KIND_APIVERSION="${KIND_APIVERSION:-kind.sigs.k8s.io/v1alpha2}"
export KUBEPROXY_PORT="${KUBEPROXY_PORT:-2224}"
export QUIET_OUTPUT="${QUIET_OUTPUT:-false}"


info "Loading"
