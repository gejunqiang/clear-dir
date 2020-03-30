#! /bin/bash

export PARENT_DIR="/parent-dir" \
       CLEAR_DIR="$PARENT_DIR/$1"

rm -rf CLEAR_DIR

