#!/bin/bash
set -e

. ../../commons/bash-utils.sh
# shellcheck disable=SC1090
. "${BASH_UTILS}"

print_header "Gitea :: test gitea/ldap container"

print_header "Gitea :: SETUP"
docker compose pull
docker compose build
docker compose up -d

print_header "Gitea :: Starting tests"

test_label "Gitea :: wait for HTTP connection"
test_curl_get "http://localhost:3000"

test_label "Gitea :: login with ldap/admin user"
test_curl_get http://localhost:3000/api/v1/user -H accept:application/json -u gitea:password

test_label "Gitea :: login with ldap/ldap user"
test_curl_get http://localhost:3000/api/v1/user -H accept:application/json -u ldap:password

print_header "Gitea :: Tear down"
docker compose down

print_header "Gitea :: All tests has finished successfully!!"