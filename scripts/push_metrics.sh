#!/bin/bash

TFSEC_ISSUES=$1
CHECKOV_ISSUES=$2
TERRASCAN_ISSUES=$3
JOB_NAME="iac_scan"

cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/$JOB_NAME
# TYPE tfsec_issues gauge
tfsec_issues ${TFSEC_ISSUES}
# TYPE checkov_issues gauge
checkov_issues ${CHECKOV_ISSUES}
# TYPE terrascan_issues gauge
terrascan_issues ${TERRASCAN_ISSUES}
EOF
