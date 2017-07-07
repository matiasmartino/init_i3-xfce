#!/usr/bin/env bash

CONTAINING_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source "$CONTAINING_DIR/definitions.sh"
cd $CONTAINING_DIR

check_root
add_repositories
install_all
setup_all
