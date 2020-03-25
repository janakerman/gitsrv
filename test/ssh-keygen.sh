#!/usr/bin/env bash

repo_root=$(git rev-parse --show-toplevel)
gen_dir=$(mktemp -d)

ssh-keygen -t rsa -N "" -f "$gen_dir/id_rsa"
defer rm -rf "'$gen_dir'"

kubectl create secret generic ssh-key \
  --from-file="$repo_root/test/known_hosts" \
  --from-file="$gen_dir/id_rsa" \
  --from-file="$gen_dir/id_rsa.pub"
