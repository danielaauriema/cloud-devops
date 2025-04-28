#!/bin/bash
set -e

. ../../commons/bash-utils.sh
# shellcheck disable=SC1090
. "${BASH_UTILS}"

. .env

JENKINS_URL="http://localhost:8080"

print_header "Jenkins :: test Jenkins/ldap container"

print_header "Jenkins :: SETUP"
docker compose pull
docker compose build
docker compose up -d

print_header "Jenkins :: starting tests"

test_label "Jenkins :: wait for connection :: ${JENKINS_URL}"
test_curl_get "${JENKINS_URL}"

test_label "Jenkins :: wait for ping with ldap user"
test_curl_get "${JENKINS_URL}/metrics/currentUser/ping" --fail -u "${LDAP_DEFAULT_USERNAME}:${LDAP_DEFAULT_PASSWORD} | grep -q pong"

print_header "Jenkins :: Tear down"
docker compose down

print_header "Jenkins :: All tests has finished successfully!!"