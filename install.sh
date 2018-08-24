#!/usr/bin/env bash

CONTAINING_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source "$CONTAINING_DIR/definitions.sh"
cd $CONTAINING_DIR

if [ "$EUID" -ne 0 ]; then echo "Please run as root."; exit; fi;

add_repositories
install_all
setup_all
