#!/bin/bash

term_handler() {
  echo "Executing term handler that does nothing"
  exit 143; # 128 + 15 -- SIGTERM
}

execute_java_cmd() {
  trap 'term_handler' SIGTERM
  exec java -jar dropwizard-example.jar server hello-world.yml &
  pid="$!"
  echo "Reviews was started"
  wait $pid
}

execute_java_cmd