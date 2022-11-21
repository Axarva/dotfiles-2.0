#!/bin/bash

set -e

echo "Welcome!" && sleep 2

echo "Doing a system update and adding needed repo, cause stuff may break if it's not the latest version..."
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update -y && sudo apt upgrade -y

echo "###########################################################################"
echo "Will do stuff, get ready"
echo "###########################################################################"

sudo apt install build-essential wget git meson cmake pkgconf libev-dev

echo "1) xserver-xorg-video-intel 	2) xserver-xorg-video-amdgpu 3) nvidia 4) Skip"
read -r -p "Choose you video card driver(default 1)(will not re-install): " vid

case $vid in
[1])
  DRI='xserver-xorg-video-intel'
  ;;

[2])
  DRI='xserver-xorg-video-amdgpu'
  ;;
[3])
  DRI='nvidia-driver-515 nvidia-dkms-515'
  ;;

[4])
  DRI=""
  ;;
[*])
  DRI='xserver-xorg-video-intel'
  ;;
esac

sudo apt install -y rofi feh xorg xinit xinput $DRI xmonad

mkdir -p ~/.local/share/fonts
mkdir -p ~/.srcs

cp -r ./fonts/* ~/.local/share/fonts/
fc-cache -f
clear

sudo apt install -y picom acpi alacritty wmctrl playerctl dunst libghc-xmonad-contrib-doc jq xclip maim xautolock i3lock imagemagick

wget https://raw.githubusercontent.com/mildmelon/betterlockscreen-ubuntu-installer/master/betterlockscreen.sh -O lock.sh && chmod 777 ./lock.sh

sudo wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && chmod 777 greenclip && sudo cp greenclip /bin/

wget https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip -O candy.zip && unzip candy.zip && sudo mv -v candy-icons-master candy-icons && sudo cp -r candy-icons /usr/share/icons/

if ! [ -f /usr/lib/libasan.so.6 ]; then
    sudo ln -s /usr/lib/libasan.so.8 /usr/lib/libasan.so.6
fi

mkdir -p ~/.config/
# cd .config/
# git clone https://gist.github.com/f70dea1449cfae856d42b771912985f9.git ./picom 
    if [ -d ~/.config/rofi ]; then
        echo "Rofi configs detected, backing up..."
        mkdir ~/.config/rofi.old && mv ~/.config/rofi/* ~/.config/rofi.old/
        cp -r ./config/rofi/* ~/.config/rofi;
    else
        echo "Installing rofi configs..."
        mkdir ~/.config/rofi && cp -r ./config/rofi/* ~/.config/rofi;
    fi
    sleep 5
    echo "1)1366 x 768       2)1920 x 1080       3)2560 x 1440"
    read -r -p "Choose your screen resolution: " res
    case $res in 
    [1])
	EWW_DIR='config/eww-1366'
	;;
    [2])
	EWW_DIR='config/eww-1920'
	;;
    [3])
  EWW_DIR='config/eww-2560'
  ;;
    [*])
	EWW_DIR='config/eww-1366'
	;;
    esac
    if [ -d ~/.config/eww ]; then
        echo "Eww configs detected, backing up..."
        mkdir ~/.config/eww.old && mv ~/.config/eww/* ~/.config/eww.old/
        cp -r ./$EWW_DIR/* ~/.config/eww;
    else
        echo "Installing eww configs..."
        mkdir ~/.config/eww && cp -r ./$EWW_DIR/* ~/.config/eww;
    fi
    if [ -f ~/.config/picom.conf ]; then
        echo "Picom configs detected, backing up..."
        cp ~/.config/picom.conf ~/.config/picom.conf.old;
        cp ./config/picom.conf ~/.config/picom.conf;
    else
        echo "Installing picom configs..."
         cp ./config/picom.conf ~/.config/picom.conf;
    fi
    if [ -f ~/.config/alacritty.yml ]; then
        echo "Alacritty configs detected, backing up..."
        cp ~/.config/alacritty.yml ~/.config/alacritty.yml.old;
        cp ./config/alacritty.yml ~/.config/alacritty.yml;
    else
        echo "Installing alacritty configs..."
         cp ./config/alacritty.yml ~/.config/alacritty.yml;
    fi
    if [ -d ~/.config/dunst ]; then
        echo "Dunst configs detected, backing up..."
        mkdir ~/.config/dunst.old && mv ~/.config/dunst/* ~/.config/dunst.old/
        cp -r ./config/dunst/* ~/.config/dunst;
    else
        echo "Installing dunst configs..."
        mkdir ~/.config/dunst && cp -r ./config/dunst/* ~/.config/dunst;
    fi
    if [ -d ~/wallpapers ]; then
        echo "Adding wallpaper to ~/wallpapers..."
        cp ./wallpapers/yosemite-lowpoly.jpg ~/wallpapers/;
    else
        echo "Installing wallpaper..."
        mkdir ~/wallpapers && cp -r ./wallpapers/* ~/wallpapers/;
    fi
    if [ -d ~/.config/tint2 ]; then
        echo "Tint2 configs detected, backing up..."
        mkdir ~/.config/tint2.old && mv ~/.config/tint2/* ~/.config/tint2.old/
        cp -r ./config/tint2/* ~/.config/tint2;
    else
        echo "Installing tint2 configs..."
        mkdir ~/.config/tint2 && cp -r ./config/tint2/* ~/.config/tint2;
    fi
    if [ -d ~/.xmonad ]; then
        echo "XMonad configs detected, backing up..."
        mkdir ~/.xmonad.old && mv ~/.xmonad/* ~/.xmonad.old/
        cp -r ./xmonad/* ~/.xmonad/;
    else
        echo "Installing xmonad configs..."
        mkdir ~/.xmonad && cp -r ./xmonad/* ~/.xmonad;
    fi
    if [ -d ~/bin ]; then
        echo "~/bin detected, backing up..."
        mkdir ~/bin.old && mv ~/bin/* ~/bin.old/
        cp -r ./bin/* ~/bin;
	clear
    else
        echo "Installing bin scripts..."
        mkdir ~/bin && cp -r ./bin/* ~/bin/;
	clear
        SHELLNAME=$(echo $SHELL | grep -o '[^/]*$')
        case $SHELLNAME in
            bash)
                if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
                    echo "Looks like $HOME/bin is not on your PATH, adding it now."
                    echo "export PATH=\$PATH:\$HOME/bin" >> $HOME/.bashrc
                else
                    echo "$HOME/bin is already in your PATH. Proceeding."
                fi
                ;;

            zsh)
                if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
                    echo "Looks like $HOME/bin is not on your PATH, adding it now."
                    echo "export PATH=\$PATH:\$HOME/bin" >> $HOME/.zshrc
                else
                    echo "$HOME/bin is already in your PATH. Proceeding."
                fi
                ;;

            fish)
                echo "I see you use fish. shahab96 likes your choice."
                fish -c fish_add_path -P $HOME/bin
                ;;

            *)
                echo "Please add: export PATH='\$PATH:$HOME/bin' to your .bashrc or whatever shell you use."
                echo "If you know how to add stuff to shells other than bash, zsh and fish please help out here!"
        esac
    fi
    

# done 
echo "PLEASE MAKE .xinitrc TO LAUNCH, or just use your Display Manager (ie. lightdm or sddm, etc.)" | tee ~/Note.txt
printf "\n" >> ~/Note.txt
echo "For startpage, copy the startpage directory into wherever you want, and set it as new tab in firefox settings." | tee -a ~/Note.txt
echo "For more info on startpage (Which is a fork of Prismatic Night), visit https://github.com/dbuxy218/Prismatic-Night#Firefoxtheme" | tee -a ~/Note.txt
echo "ALL DONE! Reboot for all changes to take place!" | tee -a ~/Note.txt
echo "Open issues on github or ask me on discord or whatever if you face issues." | tee -a ~/Note.txt
echo "Install Museo Sans as well. From Adobe I believe." | tee -a ~/Note.txt
echo "If the bar doesn't work, use tint2conf and set stuff up, if you're hopelessly lost, open an issue." | tee -a ~/Note.txt
echo "These instructions have been saved to ~/Note.txt. Make sure to go through them."
echo "For instructions regarding usage on VirtualMachines, please refer to the VM folder of the repo." | tee -a ~/Note.txt
sleep 5
xmonad --recompile



