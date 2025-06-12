#!/usr/bin/env bash

if [ ! -f "composer.json" ] && [ ! -f "composer.lock" ]; then
    echo
    echo "---"
    echo "Unable to find your composer.json and composer.lock files. Did you forget to set the app-dir parameter?"
    echo "---"
    echo
    echo "Current directory: $(pwd)"
    echo
    echo
    echo "List directory: "
    echo
    ls
    exit 1
fi

INSTALL_FLAGS=$(eval "echo $ORB_EVAL_INSTALL_FLAGS")
IFS=" " read -a args -r <<< "${INSTALL_FLAGS[@]}"

composer install "${args[@]}"
