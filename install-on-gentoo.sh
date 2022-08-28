#!/bin/bash
set -e

echo "Welcome!"
echo "Warning! Have you installed the dependencies already? If not, please do so before continuing or stuff wont work!"
echo "Dependencies are mentioned in README. Here they are anyways:"
echo "1) xmonad (by portage)"
echo "2) acpi (by portage)"
echo "3) picom (ibhagwan) (https://github.com/ibhagwan/picom)"
echo "4) alacritty (by portage)"
echo "5) dunst (by portage)"
echo "6) rofi (v 1.6.0) (echo '=rofi-1.6.0 ~amd64' >> /etc/portage/package.accept_keywords && emerge rofi)"
echo "7) candy-icon theme (https://github.com/EliverLara/candy-icons)"
echo "8) NetworkManager (by portage)"
echo "9) feh (by portage)"
echo "That should be the basics"
read -r -p "Continue? [yes/no]: " conti

case $conti in
[yY][eE][sS]|[yY])  
    mkdir -p ~/.local/share/fonts
    cp -r ./fonts/* ~/.local/share/fonts/
    fc-cache
    clear 
    if [ -d ~/.config/rofi ]; then
        echo "Rofi configs detected, backing up..."
        mkdir -p ~/.config/rofi.old && mv ~/.config/rofi/* ~/.config/rofi.old/
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
    else
        echo "Installing bin scripts..."
        mkdir ~/bin && cp -r ./bin/* ~/bin/;
    fi
    printf "\n"
    echo "PLEASE MAKE .xinitrc TO LAUNCH, or just use your Display Manager (ie. lightdm or sddm, etc.)" | tee ~/Note.txt
    printf "\n" | tee -a ~/Note.txt
    echo "Please add: export PATH='\$PATH:$HOME/bin' to your .bashrc if not done already." | tee -a ~/Note.txt
    echo "For startpage, copy the startpage directory into wherever you want, and set it as new tab in firefox settings." | tee -a ~/Note.txt
    echo "For more info on startpage (Which is a fork of Prismatic Night), visit https://github.com/dbuxy218/Prismatic-Night#Firefoxtheme" | tee -a ~/Note.txt
    echo "Reboot for all changes to take place!" | tee -a ~/Note.txt
    echo "Open issues on github or ask me on discord or whatever if you face issues." | tee -a ~/Note.txt
    echo "Install Museo Sans as well. From Adobe I believe." | tee -a ~/Note.txt
    echo "These instructions have been saved to ~/Note.txt. Make sure to go through them."
    echo "For instructions regarding usage on VirtualMachines, please refer to the VM folder of this repository." | tee -a ~/Note.txt
    sleep 5
    xmonad --recompile
	;;


[nN][oO]|[nN])
    echo "Quitting. INSTALL THOSE DEPENDENCIES. YOU USE GENTOO. YOU DO KNOW HOW TO DO IT."
    ;;

[*])
    echo "Quitting. INSTALL THOSE DEPENDENCIES. YOU USE GENTOO. YOU DO KNOW HOW TO DO IT."
	;;
esac
