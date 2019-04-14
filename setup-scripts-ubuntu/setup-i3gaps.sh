sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev xutils-dev libxcb-shape0-dev autoconf libxcb-xrm-dev gnome-flashback stow i3

export D=$PWD
mkdir -p /tmp/i3gaps
cd /tmp/i3gaps
echo Cloning i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps-next
echo Building i3-gaps
autoreconf -fi
mkdir -p build && cd build
../configure --prefix=/usr --sysconfdir=/etc
make -j4 
echo Installing i3-gaps
sudo make install
echo Installing i3-gnome
git clone https://github.com/csxr/i3-gnome.git
cd i3-gnome
sudo make install
cd $D
echo "Setting up dotfiles"
stow i3
echo "Cleaning up"
rm -rf /tmp/i3gaps

