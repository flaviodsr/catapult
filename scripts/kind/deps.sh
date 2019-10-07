#!/bin/bash
set -x

# duplicated in s/include/common.sh, needed for bootstrapping:
export CLUSTER_NAME=${CLUSTER_NAME:-kind}
export BUILD_DIR=build${CLUSTER_NAME}

. ../include/common.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  export KIND_OS_TYPE="${KIND_OS_TYPE:-kind-darwin-amd64}"
else
  export KIND_OS_TYPE="${KIND_OS_TYPE:-kind-linux-amd64}"
fi

if [ -z "$EKCP_HOST" ]; then
    curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/${KIND_OS_TYPE}
    chmod +x kind
    mv kind bin/kind
fi

popd
