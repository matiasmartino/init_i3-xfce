INIT_ENV_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source "$INIT_ENV_DIR/conf/env.sh"

fcp() { 
	mkdir -p "$2" && \cp -rf "$1" "${2%/}/$3"; 
}

check_root() { 
	if [ "$EUID" -ne 0 ]; then echo "Please run as root."; exit; fi; 
}

add_repositories() {
	add-apt-repository -y ppa:aacebedo/libi3ipc-glib
	add-apt-repository -y ppa:aacebedo/xfce4-i3-workspaces-plugin
	apt-get update
}

install_all() {
	apt-get install -y gnome-disk-utility
	apt-get install -y gmrun
	apt-get install -y nitrogen
	apt-get install -y i3
	apt-get install -y libi3ipc-glib
	apt-get install -y xfce4-i3-workspaces-plugin
}

setup_i3() {
  i3_path=$INIT_ENV_DIR/conf/i3
	fcp $i3_path/i3.desktop $XFCE_AUTOSTART_PATH
	fcp $i3_path/. $I3_CONFIG_PATH
}

setup_xfce() {
  xfce_path=$INIT_ENV_DIR/conf/xfce
	fcp $xfce_path/xfce4-keyboard-shortcuts.xml $XFCE_CONFIG_PATH
	fcp $xfce_path/xfce4-session-host:0 $XFCE_SESSIONS_PATH xfce4-session-$HOSTNAME:0
}

setup_all() {
	setup_i3
	setup_xfce
}
