#!/bin/bash

term_handler() {
  echo "Executing term handler that does nothing"
  exit 143; # 128 + 15 -- SIGTERM
}

execute_python_cmd() {
  trap 'term_handler' SIGTERM
  exec python productpage.py 9080 &
  pid="$!"
  echo "Product page was started"
  wait $pid
}

execute_python_cmd