# Knave's C.L.U.B.
> Knaveightt's **C**onfigured **L**inux **U**sing **B**spwm, my dotfiles for
> what I consider the core of my linux configuration.

## Description
These are my dotfiles for what I consider the core of my linux workstation,
using the [bspwm window manager](https://github.com/baskerville/bspwm). I will
list out and maintain the configuration files for the core scripts and
applications for this setup, and I loosley plan on writing some sort of
deployment script for a (more) easy installation to other systems as well. 

## Usage Info
Typically, if I am setting up a workstation from scratch to use this core 
environment, I will first and foremost make sure I have a working default 
X instance and working internet to download packages. Number one priority
is an updated base installation with a working internet connection. Once
there, I start to setup the vanilla graphical session with X and a WM.

For example on Void Linux, I will ensure I have installed xorg, xinit, 
bspwm, sxhkd, and xterm. I will confirm the following:
- I copied over the default config files for bspwm/sxhkd
- I quickly update sxhkd to call xterm for a temporary terminal solution
- I copy over the default xinitrc, and edit it to launch bspwm
- Give startx a go!

Once there, I will typically install and configure git so I can get the
latest version of this repository to guide me through configuration. Then, I'll 
try to setup my build of [st](https://github.com/knaveightt/st-knaveightt-void), 
and have my working configuration of [neovim](https://github.com/knaveightt/knaveovim).
After getting those installed and configured, this is typically the first good
stage to confirm I am comfortable with my colorscheme choices, and edit my
Xresources file appropriately. Lastly I'll install my build of
[dmenu](https://github.com/knaveightt/dmenu-knaveightt-void) before setting up
the rest of my foundational programs.  

At this point I now begin to incorporate my bwpwm and sxhkd settings from this
repository. This does mean downloading of some extra packages that are called
from my bspwm script:
- dunst
- nitrogen

I'll comment out and hold off installing the bar and system tray at the moment.
To make this work however, I'll also bring in my scripts to the .local/bin folder,
and my bashrc / profile scripts. To make my scripts work, the following are 
required:
- xbacklight
- xtitle
- nvimpager
- neofetch
- starship (plus use the config file in this repository)
- Note, you will need to enable users to run /bin/shutdown using sudo w/o passwd

Once comfortable with the above, I'll then work on getting my bar setup, as
well as the system tray. To make my bar work, the following are required:
- make sure the necessary fonts have been installed
- acpi
- htop
- xprop
- lemonbar-xft
- trayer-srg
- NetworkManager, network-manager-applet (make sure you disable dhcpcd,
wpa_supplicant and enable NetworkManager service, plus ensure dbus is installed
and enabled as well as polkit)
This is also a second good place to make sure I am comfortable with my theme and 
colors.

Once Here, I'll make sure i am comfortable with power managemnet (via acpi),
and have a screenlocking mechanism (xscreensaver)


*The rest of this section is TBD*
Still to plan for includes:
- power management (thinking of powerkit/xscreensaver)
- shutdown/logout/locking management (thinking of powerkit/xscreensaver)
- any dependencies for the bash prompt / bashrc scripts
- other general configuration items like
  - visudo file updates to allow shutdown without password
  - system logging
  - anything else in the void linux configuration handbook

## Applications
Here I will list out the core applications that are used in this configuration
setup. This repo is a work in progress, so I will update the table below as I
go.

#### Foundational
| Function | Application | Configuration Status | Hard Dependency | Config Depdendency |
| -------- | ----------- | -------------------- | --------------- | ------------------ |
| Window manager | bspwm | Complete | None | {sxhkd,dunst,lemonbar,trayer},xrdb,nitrogen | 
| Hotkey setup | sxhkd | 50% Complete | None | [kc-logout,kc-windows,kc-brightness],{st,nvim,dmenu},lightdm,firefox,xfce4-appfinder,lfrun,thunar,weechat,kvirc |
| Terminal | st | [Complete](https://github.com/knaveightt/st-knaveightt-void) | None | (see repository) |
| Editor | neovim | [Complete](https://github.com/knaveightt/knaveovim) | None | (see repository) |
| Launcher | dmenu | [Complete](https://github.com/knaveightt/dmenu-knaveightt-void) | None | (see repository) |
| Notifications | dunst | Complete |
| Bar | lemonbar | Complete |
| System Tray | trayer | Complete |
| Screen Lock | xscreensaver | Not Started |

#### Terminal Applications
| Function | Application | Configuration Status |
| -------- | ----------- | -------------------- |
| File Explorer | lf | Not started |
| IRC | weechat | Not Started |
| Email | neomutt | Not Started |

#### GUI Applications (for launching via hotkeys)
| Function | Application | Configuration Status | 
| -------- | ----------- | -------------------- | 
| Web Browser | firefox | **Complete** |
| File Explorer | pcmanfm | **Complete**, uses gvfs, udisks2 |
| IRC Chat | kvirc | **Complete** |
| Email Client | thunderbird | Not started |

#### Utility Scripts
| Function | Script Name | Configuration Status | 
| -------- | ----------- | -------------------- |
| Shutdown Script | kc-logout | Complete |
| Reload Config | kc-reload | Complete |
| Window Switch | kc-windows | Complete |
| Reload WM/Key/Bar Menu | kc-reload | Not started |
| Configuration File Browser | kc-configs | Not started |
| Emoji Viewer | kc-emojis | Not started |
| Clipboard Viewer | kc-clip-view | Not started |
| Bookmark Viewer | kc-bookmarks | Not Started |

## Hotkeys Configured
Here is a list of hotkeys for this window manager configuration. Each key
assumes the `mod` key is also pressed as well.
- `Escape` launch Shutdown script
- `Enter` launch terminal
- `CTRL+r` reload WM script (reload BSPWM or reload SXHKD)

- `q` Quit/Kill window, `Q` *reserved for volume control*
- `w` list windows script, `W` GUI Web Browser (Firefox)
- `e` terminal file explorer (lf), `E` GUI File Explorer (pcmanfm)
- `r` terminal IRC (weechat), `R` GUI IRC (KVIRC)
- `t` terminal email (neomutt), `T` GUI Email Client (Thunderbird)

- `a` application launcher,  `A` launch auto-configured set of applications (TBD)
- `s` search in Web, `S` sticky current window 
- `d` toggle tiling mode (tiled,monacle), `D` or `CTRL+D` cycle to the next or prev node/window
- `f` toggle fullscreen window, `F` toggle floating window

- `z` go back to previous focused window, `Z` lock screen 
- `x` execute command (dmenu_run), `X` launch xkill
- `c` launch Emoji Viewer, `C` launch Configuration File Browser
- `v` launch Clipboard Viewer, `V` clear clipboard history
- `b` launch Bookmark Explorer, `B` toggle bar visibility
- `n` launch seperate Neovim window

## Miscellaneous
Just posting some lemonbar links as I am highly interested in taking a minimal approach and using lemonbar + trayer as my status bar.
- [https://www.linuxjournal.com/content/using-named-pipes-fifos-bash](https://www.linuxjournal.com/content/using-named-pipes-fifos-bash)
- [https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/melonbar](https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/melonbar)
- [https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/statusline](https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/statusline)
- [https://github.com/JLErvin/dotfiles/blob/master/scripts/simplebar](https://github.com/JLErvin/dotfiles/blob/master/scripts/simplebar)
- [here is a link to some workarounds resizing lemonbar with a dynamic system tray](https://github.com/LemonBoy/bar/issues/182)

Also, there are things I will want to remember to document in this repo:
- Any additional programs that are referenced in my scripts or configs
- How I choose to theme programs that are not directly themed by these configs including
  - any GTK / QT theming
  - Special note for QT theming, I found [these steps](https://askubuntu.com/questions/910012/how-can-i-get-qt5-applications-to-use-the-gtk-theme-in-ubuntu-17-04)
    for making sure QT follows the GTK2 theme. I had to:
    - install qt5ct and qt5-styleplugins
    - update `/etc/enviornment` by adding `QT_QPA_PLATFORMTHEME=qt5ct`
    - Use qt5ct to set the theme to GTK, and lxappearance to set the GTK theme
- Profile specific files like
  - .bashrc
  - .Xresources

This is where the dependency is for the git prompt in bash:
- [https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
- [https://gist.github.com/justintv/168835](https://gist.github.com/justintv/168835)
