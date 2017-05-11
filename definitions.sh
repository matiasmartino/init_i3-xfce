fcp() { 
	mkdir -p "$2" && \cp -rf "$1" "${2%/}/$3"; 
}

check_root() { 
	if [ "$EUID" -ne 0 ]; then echo "Please run as root."; exit; fi; 
}

add_respositories() {
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
	cd i3/
	fcp i3.desktop $XFCE_AUTOSTART_PATH
	fcp config $I3_CONFIG_PATH
	cd ..
}

setup_xfce() {
	cd xfce/
	fcp xfce4-keyboard-shortcuts.xml $XFCE_CONFIG_PATH
	fcp xfce4-session-host:0 $XFCE_SESSIONS_PATH xfce4-session-$HOSTNAME:0
	setup_xfce_panel
	cd ..
}

setup_xfce_panel() {
	cd panel/
	fcp xfce4-panel.xml $XFCE_CONFIG_PATH
	fcp launcher-10 $XFCE_PANEL_PLUGINS_PATH
	fcp i3-workspaces.-9.rc $XFCE_PANEL_PLUGINS_PATH
	cd ..
}

setup_all() {
	cd conf/
	setup_i3
	setup_xfce
	cd ..
}
