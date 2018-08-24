INIT_ENV_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source "$INIT_ENV_DIR/conf/env.sh"

fcp() { 
	mkdir -p "$2" && \cp -rf "$1" "${2%/}/$3"; 
}

add_respositories() {
	add-apt-repository -y ppa:aacebedo/libi3ipc-glib
	#add-apt-repository -y ppa:aacebedo/xfce4-i3-workspaces-plugin
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9B91A3661D4724D5CAA5E2B21ACA1DAE834F228
  echo "deb http://ppa.launchpad.net/aacebedo/xfce4-i3-workspaces-plugin/ubuntu artful main" | sudo tee /etc/apt/sources.list.d/xfce4-i3-workspaces.list
  apt update
}

install_all() {
	apt-get install -y gmrun
	apt-get install -y nitrogen
	apt-get install -y i3
	apt-get install -y libi3ipc-glib
	apt-get install -y xfce4-i3-workspaces-plugin
}

setup_i3() {
	cd i3/
	fcp i3.desktop $XFCE_AUTOSTART_PATH
	#fcp config $I3_CONFIG_PATH
	cd ..
}

setup_xfce() {
  xfce_path=$INIT_ENV_DIR/conf/xfce
  fcp $xfce_path/xfce4-keyboard-shortcuts.xml $XFCE_CONFIG_PATH
}

setup_all() {
	cd conf/
	setup_i3
  setup_xfce
	cd ..
}
