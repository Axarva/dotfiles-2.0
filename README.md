# Dotfiles: 2.0
Made after an evolution
## Table of Contents
- [About](#about)
- [Gallery](#gal)
- [Installation](#inst)
  - [Arch Install](#arch)
  - [Other Install](#other)
- [Dependencies](#deps)
- [Troubleshooting](#trouble)

<a id="about"></a>

## Starring:
- xmonad
- eww
- firefox
- rofi
- tint2
- *Insert more stuff here*



Hello! Thank you for dropping by! These are my xmonad configurations, made after I went through... no, let's stop that 
there already. If you're here, I suppose you want to be cloning this configuration, for which look at the Installation Section below. Even if you're not, just look through the gallery:



<a id="gal"></a>
<img src='/screenshots/sidebar.png'>
<img src='/screenshots/firefox.png'>
<img src='/screenshots/center.png'>

<a id="inst"></a>
## Installation
Alright, let's get to the main stuff.


Note: Whatever method you follow, if you want the weather and quote features to work as well, you need to modify your crontab as follows: <br>
(To edit your crontab, `crontab -e` as a normal user.)



```
0,30 * * * * /home/{Your-username}/.config/eww/scripts/getweather
@reboot sleep 10 && /home/{Your-username}/.config/eww/scripts/getquotes
```


And please follow these next few steps as well:
- Add `export PATH="$PATH:/home/{Your_User}/bin"` to your `~/.zshrc` file.
- Edit the script in `~/.config/eww/scripts/getweather`. Further steps are specified within that file.
- Open `tint2conf` and edit the theme `panellauncher.tint2rc`. In there, head over to the `Launcher` tab and set the icon theme as candy-icons.
- Get the Museo Sans font from Adobe itself or any other sources, put the `.ttf` file in your `~/.local/share/fonts`
  - Run `fc-cache` after getting the font.
- If the widgets don't work properly, go to [the main repository](https://github.com/elkowar/eww) and install `eww` as documented. Make sure the resulting binary is stored in `~/bin`.
- Issue `xmonad --recompile` after you complete all the steps, and relogin to xmonad.
- Minor details: If you are on `systemd`, edit all the files related to powermenus to match the commands specific to systemd. For example:

```bash
loginctl suspend
```

And:
```bash
doas poweroff
```

Become:

```bash
systemctl suspend
```

And:


```bash
systemctl poweroff
```


Respectively.

<a id="sysd-replace"></a>

### Stuff to global-replace for systemd users
- `loginctl suspend` with `systemctl suspend`
- `doas reboot` with `systemctl reboot`
- `doas poweroff` with  `systemctl poweroff`

These references occur in the following files:
- bin/powermenu.sh
- eww*/scripts/shutdown.sh
- eww*/scripts/reboot.sh
- eww*/scripts/suspend.sh

`doas` references:
- eww*/scripts/getvpnstat (You probably won't be using protonvpn, so you could just ignore this as well.)
- eww*/scripts/shutdown.sh
- eww*/scripts/reboot.sh

<a id="arch"></a>

### For Arch Linux and it's derivatives (make sure you have git installed):
**Piece of good advice**: Since you are on an Arch-based distro, it is likely you use `systemd`. In case you don't go ahead and ignore this and skip to [Going Ahead: Arch Edition](#ga-arch).


In case you do, I recommend opening this repository in a text editor after you clone it, and global-replace the stuff specified in [Stuff for sysd users](#sysd-replace). After that, go ahead with [Going Ahead: Arch Edition](#ga-arch).


<a id="ga-arch"></a>

#### Going Ahead: Arch Edition

Note: THIS MAKES BACKUPS TOO, SO YEAH. JUST DO IT. DO IT!


```bash
$ git clone https://github.com/Axarva/dotfiles-2.0.git
$ cd ./dotfiles-2.0
$ chmod +x ./install-on-arch.sh
$ ./install-on-arch.sh
```



That'll do the basic stuff. For a complete kang (kang means copying, don't mind my jargon), look at the list of dependencies below.

AND DON'T FORGET TO READ WHAT'S WRITTEN AT THE END OF THE MAIN INSTALLATION SECTION [UP THERE](#inst). Further steps are specified there. (Yes. Absolutely needs to be shouty capitals.)



<a id="other"></a>

### For Gentoo Linux users (And basically any other distro):
I'm sorry guys, I couldn't do it. I'm having a mental breakdown rn.

**Piece of good advice**:  If you don't use `systemd` go ahead and ignore this and skip to [Going ahead: Others Edition](#ga-other).



In case you do use `systemd`, I recommend opening this repository in a text editor after you clone it, and global-replace the stuff specified in [Stuff for sysd users](#sysd-replace). After that, go ahead with [Going ahead: Others Edition](#ga-other).

<a id="ga-other"></a>

#### Going Ahead: Others Edition
You need to install the dependencies yourself, this script will add the fonts and the configs (AND BACK UP EXISTING ONES TOO, FOR GOD'S SAKE DON'T BE SO PARANOID):


```bash
$ git clone https://github.com/Axarva/dotfiles-2.0.git
$ cd ./dotfiles-2.0
$ chmod +x ./install-on-gentoo.sh
$ ./install-on-gentoo.sh
```

AND DON'T FORGET TO READ WHAT'S WRITTEN AT THE END OF THE MAIN INSTALLATION SECTION [UP THERE](#inst). Further steps are specified there. (Yes. Absolutely needs to be shouty capitals.)
<a id="deps"></a>
## Dependencies
Ahhhhh the other main stuff. Here you go, peeps. Make sure you have em all.



-    xmonad (OF COURSE, DUH)
-    eww (ElKowar's Wacky Widgets, binary included, but I encourage you to build it yourself and put the binary in your ~/bin). [Link](https://github.com/elkowar/eww)
-    firefox (Yup)
-    rofi version 1.6.0 (Configs originally come from @adi1090x, been edited by me).
-    tint2 (Install using package manager, other binary from my fork is provided)
-    acpi
-    Museo Sans Font by Adobe (I think it needs some sort of acount, but get it) Or just search for it on the web and get it somewhere
-    ~~Any Nerd Font, Iosevka recommended along with Hurmit.~~ Nerd Fonts now included in folder.[Link](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka) 
-    playerctl
-    brightnessctl. [Link](https://github.com/Hummer12007/brightnessctl)
-    OpenRC (Wait a sec, yep, remember to edit the powermenu files if you use systemd)
-    candy-icons. [Link](https://github.com/EliverLara/candy-icons)
-    dunst
-    Spotify (for cover art, else edit the eww/scripts/getart script accordingly)
-    An OpenWeatherMap Account, (view eww/scripts/getweather script for more info)
-    feh
-    NetworkManager
-    zsh (THIS IS IMPORTANT)
-    alacritty
-    picom (fork of ibhagwan or jonaburg)
-    doas- wait, just replace doas occurences with sudo, or go macho and install doas
-    jq: Command line json parser (Needed for widgets)
-    maim and xclip for screenshots
-    mpv for low-battery sound playing (Not exactly necessary, you'll get the notification, but the sound depends on it.)
-    *Might need to be updated, so please tell me*

<a id="trouble"></a>
## Troubleshooting
And here we are:


1. If xmonad doesn't build make sure you have `xmonad-contrib`
2. Bar looks weird: Try editing it a bit using `tint2conf`. 
3. Alacritty configs are faulty: I'm not sure about this one, works perfectly fine for me. 
4. Widgets positioning weird: I hardcoded them for a 1366x768 screen, will create others if I can
5. Fonts: GET THOSE FONTS!
6. **MAKE SURE YOUR `~/bin` DIRECTORY IS INSIDE YOUR PATH, OR NOTHING WILL WORK!** (Yes. Absolutely needs to be shouty capitals.)
7. Anything else? Open up an issue.
# Good Luck and Cheers!
