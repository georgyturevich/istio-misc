#!/bin/bash

term_handler() {
  echo "Executing term handler that does nothing"
  exit 143; # 128 + 15 -- SIGTERM
}

execute_java_cmd() {
  trap 'term_handler' SIGTERM
  exec /opt/ibm/helpers/runtime/docker-server.sh /opt/ibm/wlp/bin/server run defaultServer &
  pid="$!"
  echo "Reviews was started"
  wait $pid
}

execute_java_cmd