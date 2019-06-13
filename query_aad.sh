#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

function check_deps() {
  test -f $(which jq) || error_exit "jq command not detected in path, please install it"
  test -f $(which az) || error_exit "az command not detected in path, please install it"
}

function parse_input() {
  eval "$(jq -r '@sh "export USERID=\(.userid)"')"
}

function return_output() {
    OBJ_ID=$(az ad user show --upn-or-object-id "${USERID}" | jq -r ".objectId" | tr -d '\n')
    echo "{\"objectId\": \"${OBJ_ID}\"}"
}

check_deps && \
parse_input && \
return_output
