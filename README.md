<img src='/screenshots/yeeyee.jpg'>

<h1 align="center">✨ Widgets go brr! ✨</h1>


<p align="center">
  <a href="https://github.com/Axarva/dotfiles-2.0/stargazers"><img src="https://img.shields.io/github/stars/Axarva/dotfiles-2.0?color=ffd5cd&style=for-the-badge&logo=starship"></a>
  <a href="https://github.com/Axarva/dotfiles-2.0/issues"><img src="https://img.shields.io/github/issues/Axarva/dotfiles-2.0?color=d35d6e&style=for-the-badge&logo=codecov"></a>
  <a href="https://github.com/Axarva/dotfiles-2.0/network/members"><img src="https://img.shields.io/github/forks/Axarva/dotfiles-2.0?color=84afdb&style=for-the-badge&logo=jfrog-bintray"></a>
  <a href="https://github.com/Axarva/dotfiles-2.0/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-orange.svg?color=90c861&style=for-the-badge&logo=mitsubishi"></a>
</p>

## ~~A Note:~~ I'm back.

## Table of Contents

- [About ⁉️](#about)
- [Gallery 📷](#gal)
- [Workflow 🖨️](#workflow)
- [Keybinds ✍️](#keybinds)
- [Installation 🤵‍](#inst)
  - [Arch Install 🌇](#arch)
  - [Other Install 🚂](#other)
- [Dependencies 📊](#deps)
- [Troubleshooting 🔫](#trouble)

<a id="about"></a>

## Starring:


<img src="/screenshots/EwwLogo.png" alt="eww" align="right" height="180vh">

- **Note:** Check out the `modified` branch for a newer setup. Hope you like it!
- **xmonad** ⚽ 
- **eww** (Very wacky)
- **firefox** 🦊
- **rofi** 💈
- **tint2 ([This](https://github.com/Axarva/tint2-1) fork is the only supported fork.)** 🍫
- **Inhibitors** 👁️ (Inhibitors are cool stuff that prevent auto screen lock when you're watching a video or something)
- **Healthy stuff** ❤️ (Yeah, you get notifications to fix your posture and take a break)
- *Insert more stuff here*

Hello! Thank you for dropping by! 👋

These are my xmonad configurations, and they go brr! 🚀 (Let's stop that there).

If you're here, I suppose you want to be cloning this configuration, for which look at the Installation Section below. 👇 

Even if you're not, just look through the gallery:



<a id="gal"></a>
<img src='/screenshots/sidebar.png'>
<img src='/screenshots/firefox.png'>
<img src='/screenshots/center.png'>

<a id="workflow"></a>

## Workflow 🖨️
Workflow GIF: (This is a short one, for more goodies look at the links below)

(Also, compression made it look kinda bad, but I think it shows what it needs to)


<p align="center">
  <img src="https://github.com/Axarva/gifs/blob/main/workflow.gif">
</p>

[Workflow Video by SavvyNik](https://www.youtube.com/watch?v=rMoUCnqhYfs) aka [@SavvyNik](https://github.com/SavvyNik)


[Workflow Video by Guilherme Moreno](https://www.youtube.com/watch?v=im9QKZSMUFQ) aka [@morenoled](https://github.com/morenoled)

<a id="keybinds"></a>
## Keybinds ✍️

These are the basic keybinds. Read through the `xmonad/xmonad.hs` file for more keybinds like increasing gaps and restoring gaps.

|        Keybind         |                 Function                 |
| ---------------------- | ---------------------------------------- |
| `Win + Shift + Enter`  | Launch terminal (alacritty)              |
| `Win + Shift + C`      | Close window                             |
| `Win + O`              | Open rofi menu                           |
| `Win + Shift + Q`      | Open rofi powermenu                      |
| `Win + S`              | Open sidebar                             |
| `Win + Shift + S`      | Close sidebar                            |
| `Win + P`              | Open dashboard                           |
| `Win + Shift + P`      | Close dashboard                          |
| `Win + B`              | Toggle the main bars                     |
| `Win + Z`              | Activate inhibitor (Stops autolocking)   |
| `Win + Shift + Z`      | Dectivate inhibitor (Enables autolocking)|
| `Win + Ctrl + G`       | Toggle gaps (toggle to get screen space) |
| `Win + J`              | Navigate through windows                 |
| `Win + K`              | Navigate through windows                 |
| `Win + Space`          | Switch through layouts                   |
| `Win + T`              | Make a floating window tiled             |

Note: `Toggling` means to enable if inactive or to disable if active.


Note: `Win` refers to the `Super` key.


<a id="inst"></a>
## Installation 🤵‍
Alright, let's get to the main stuff.


If you feel like you don't want to read so much, here's a video, courtesy of [@SavvyNik](https://github.com/SavvyNik)!

[Nik's Installation Video for Arch Linux](https://www.youtube.com/watch?v=a8YJBGk8H4Q)



Note: Whatever method you follow, if you want the weather and quote features to work as well, you need to modify your crontab as follows: <br>
(To edit your crontab, `crontab -e` as a normal user.)



```
0,30 * * * * /home/{Your-username}/.config/eww/scripts/getweather
@reboot /home/{Your-username}/.config/eww/scripts/getquotes
```


And please follow these next few steps as well:
- Add `export PATH="$PATH:$HOME/bin"` to your `~/.bashrc` file (or a shell of your choice).
- Edit the script in `~/.config/eww/scripts/getweather`. Further steps are specified within that file.
- Open `tint2conf` and edit the theme `panellauncher.tint2rc`. In there, head over to the `Launcher` tab and set the icon theme as candy-icons.
- Get the Museo Sans 300 (ONLY THE 300 WEIGHT PLEASE, OTHERS LOOK WEIRD) font from Adobe itself or any other sources, put the `.ttf` or `.otf` file in your `~/.local/share/fonts`
  - Run `fc-cache -f` after getting the font.
- If the widgets don't work properly, go to [the main repository](https://github.com/elkowar/eww) and install `eww` as documented. Make sure the resulting binary is stored in `~/bin`.
- Issue `xmonad --recompile` after you complete all the steps, and relogin to xmonad.
- For the profile picture to load, it needs to have the full path in `eww.scss`. Open the file, search for the string containing `~/.config`(line number 329 to be exact) and edit it to point it to your image. Full path required. For example: `$HOME/path/to/image.png`.




<a id="arch"></a>

### For Arch Linux and it's derivatives (make sure you have git installed): 🌇

THIS MAKES BACKUPS TOO, SO YEAH. JUST DO IT. DO IT!


```bash
$ git clone https://github.com/Axarva/dotfiles-2.0.git
$ cd ./dotfiles-2.0
$ chmod +x ./install-on-arch.sh
$ ./install-on-arch.sh
$ sudo ln -s /usr/lib/libasan.so.8 /usr/lib/libasan.so.6 #This is here for tint2 to work.
```



That'll do the basic stuff. For a complete copy, look at the list of dependencies below.

AND DON'T FORGET TO READ WHAT'S WRITTEN AT THE END OF THE MAIN INSTALLATION SECTION [UP THERE](#inst). Further steps are specified there. (Yes. Absolutely needs to be shouty capitals.)



<a id="other"></a>

### For Gentoo Linux users (And basically any other distro): 🚂
I'm sorry I couldn't do it. You'll have to manually install dependencies.

**Piece of good advice**:  If you use `systemd`, go ahead and ignore this, and skip to [Going ahead: Others Edition](#ga-other).


In case you use something else, I recommend opening this repository in a text editor after you clone it, and global-replace the stuff that suits your system. After that, go ahead with [Going ahead: Others Edition](#ga-other).

<a id="ga-other"></a>

#### Going Ahead: Others Edition
You need to install the dependencies yourself, this script will add the fonts and the configs (and back up existing ones too):


```bash
$ git clone https://github.com/Axarva/dotfiles-2.0.git
$ cd ./dotfiles-2.0
$ chmod +x ./install-on-gentoo.sh
$ ./install-on-gentoo.sh
```

AND DON'T FORGET TO READ WHAT'S WRITTEN AT THE END OF THE MAIN INSTALLATION SECTION [UP THERE](#inst). Further steps are specified there. (Yes. Absolutely needs to be shouty capitals.)
<a id="deps"></a>
## Dependencies 📊
Here you go. Make sure you have em all.


-    xmonad
-    [eww](https://github.com/elkowar/eww) (ElKowar's Wacky Widgets, binary included, but I encourage you to build it yourself and put the binary in your ~/bin).
-    firefox (Not exactly a dependency)
-    rofi version 1.7.0 (Configs originally come from @adi1090x, been edited by me).
-    tint2 (Please use [this fork](https://github.com/Axarva/tint2-1) ONLY, or issues will occur. Binaries provided already.)
-    acpi
-    Museo Sans Font by Adobe (I think it needs some sort of acount, but get it) Or just search for it on the web and get it somewhere
-    [Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka) (I include some, but you can use any of your choice.)
-    playerctl
-    [brightnessctl](https://github.com/Hummer12007/brightnessctl)
-    [candy-icons](https://github.com/EliverLara/candy-icons)
-    dunst
-    Spotify (for cover art, else edit the eww/scripts/getart script accordingly)
-    An OpenWeatherMap Account, (view eww/scripts/getweather script for more info)
-    feh
-    NetworkManager
-    greenclip
-    alacritty
-    picom (fork of ibhagwan or jonaburg)
-    jq: Command line json parser (Needed for widgets)
-    maim and xclip for screenshots
-    mpv for low-battery sound playing (Not exactly necessary, you'll get the notification, but the sound depends on it.)
-    *Might need to be updated, so please tell me*

<a id="trouble"></a>
## Troubleshooting 🔫
And here we are:


1. If xmonad doesn't build make sure you have the `xmonad-contrib` package.
2. Bar looks weird: Try editing it a bit using `~/bin/tint2conf`. 
3. Alacritty configs are faulty: I'm not sure about this one, works perfectly fine for me. 
4. Widgets positioning weird: I hardcoded them for a 1366x768 screen, will create others if I can
5. Fonts: GET THOSE FONTS!
6. **MAKE SURE YOUR `~/bin` DIRECTORY IS IN YOUR PATH, OR NOTHING WILL WORK!** (Yes. Absolutely needs to be shouty capitals.)
7. For instructions regarding use on VirtualMachine, please do check the `VM` folder of this repository.
8. Bars not showing on Arch Linux: `sudo ln -s /usr/lib/libasan.so.8 /usr/lib/libasan.so.6`
9. The workspace indicator bar issue has been solved through the binaries in my fork.
10. Anything else? Open up an issue.
   
   
<h1 align="center">🌟 Good Luck and Cheers! 🌟</h1>
