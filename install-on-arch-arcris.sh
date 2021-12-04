#!/bin/env bash
set -e
sudo pacman -S --noconfirm --needed base-devel wget git

sudo pacman -S --noconfirm --needed rofi nitrogen xorg xorg-xinit xorg-xinput xmonad

# install fonts, window manager and terminal
mkdir -p ~/.local/share/fonts
mkdir -p ~/.srcs

# cd ~/.srcs 

# git clone $CLIENT/$FONT 
cp -r ./fonts/* ~/.local/share/fonts/
fc-cache -f
clear 

# git clone $CLIENT/$WM 
# cd $WM/ && sudo make clean install

# cd ~/.srcs/

# git clone $CLIENT/$EMU 
# cd $EMU/ && sudo make clean install 

# cd ~/.srcs/

# git clone $CLIENT/$EXT
# cd $EXT/ && sudo make clean install

# install paru
# echo "Please replace libxft with libxft-bgra in next install"

git clone https://aur.archlinux.org/paru.git ~/.srcs/paru
cd ~/.srcs/paru/ && makepkg -si

paru -S picom-jonaburg-git acpi candy-icons-git wmctrl alacritty playerctl dunst xmonad-contrib jq xclip maim rofi-greenclip lightdm-webkit-theme-aether lightdm-webkit2-greeter
#install custom picom config file
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


      cmd=(dialog --keep-tite --backtitle "select your screen size" \
            --no-collapse --cr-wrap --column-separator "|" --no-tags --ok-label '< Seleccionar >' --nocancel --menu "Selecciona una opción para GNOME \n\n" 10 60 19)

            options=(1 "1366x768"
                     2 "1920x1080")

            choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

            for choice in $choices
            do
                case $choice in
                1) EWW_DIR='config/eww-1366'
                   ;;
                2) EWW_DIR='config/eww-1920'
                   ;;
                esac
            done
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
        echo "Please add: export PATH='\$PATH:$HOME/bin' to your .bashrc or whatever shell you use."
    fi
    

# done 
echo "PLEASE MAKE .xinitrc TO LAUNCH, or just use your Display Manager (ie. lightdm or sddm, etc.)" | tee ~/Note.txt
printf "\n" >> ~/Note.txt
echo "Please add: export PATH='\$PATH:$HOME/bin' to your .bashrc if not done already." | tee -a ~/Note.txt
echo "For startpage, copy the startpage directory into wherever you want, and set it as new tab in firefox settings." | tee -a ~/Note.txt
echo "For more info on startpage (Which is a fork of Prismatic Night), visit https://github.com/dbuxy218/Prismatic-Night#Firefoxtheme" | tee -a ~/Note.txt
echo "ALL DONE! Reboot for all changes to take place!" | tee -a ~/Note.txt
echo "Open issues on github or ask me on discord or whatever if you face issues." | tee -a ~/Note.txt
echo "Install Museo Sans as well. From Adobe I believe." | tee -a ~/Note.txt
echo "If the bar doesn't work, use tint2conf and set stuff up, if you're hopelessly lost, open an issue." | tee -a ~/Note.txt
echo "These instructions have been saved to ~/Note.txt. Make sure to go through them."
echo "For instructions regarding usage on VirtualMachines, please refer to the VM folder of the repo." | tee -a ~/Note.txt
sleep 10
xmonad --recompile
