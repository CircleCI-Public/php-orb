#!/usr/bin/env bash
if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi
INSTALL_DIR=$(eval "echo ${ORB_EVAL_INSTALL_DIR}")
FILENAME=$(eval "echo ${ORB_VAL_FILENAME}")

EXPECTED_CHECKSUM="$($SUDO php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
$SUDO php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$($SUDO php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
    >&2 echo 'ERROR: Invalid installer checksum'
    $SUDO rm composer-setup.php
    exit 1
fi

if [ -n "${ORB_VAL_INSTALL_VERSION}" ]; then
    set -- "$@" --version "${ORB_VAL_INSTALL_VERSION}"
fi

$SUDO php composer-setup.php --quiet --filename="${FILENAME}" --install-dir="${INSTALL_DIR}" "$@"
RESULT=$?
$USOD rm composer-setup.php
exit $RESULT