#!/usr/bin/env bash

ORB_VAL_INSTALL_DIR=$(eval echo "${ORB_VAL_INSTALL_DIR}")

curl -sS https://getcomposer.org/installer -o composer-setup.php
if [ -n "${ORB_VAL_INSTALL_VERSION}" ]; then
    set -- "$@" --version "${ORB_VAL_INSTALL_VERSION}"
fi

sudo php composer-setup.php --filename=composer --install-dir="${ORB_VAL_INSTALL_DIR}" "$@"


