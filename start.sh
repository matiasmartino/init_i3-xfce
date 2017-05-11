#!/usr/bin/env bash

source ./conf/env.sh
source ./definitions.sh

check_root
add_repositories
install_all
setup_all
