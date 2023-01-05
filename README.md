# Knave's Club
> Knaveightt's **C**onfigured **L**inux **U**sing **B**spwm, my dotfiles for
> what I consider the core of my linux configuration.

## Description
These are my dotfiles for what I consider the core of my linux workstation,
using the [bspwm window manager](https://github.com/baskerville/bspwm). I will
list out and maintain the configuration files for the core scripts and
applications for this setup, and I loosley plan on writing some sort of
deployment script for a (more) easy installation to other systems as well. 

## Applications
Here I will list out the core applications that are used in this configuration
setup. This repo is a work in progress, so I will update the table below as I
go.

#### Foundational
| Function | Application | Configuration Status | 
| -------- | ----------- | -------------------- | 
| Window manager | bspwm | not started |
| Hotkey setup | sxhkd | not started |
| Bar | polybar | not started |
| Editor | neovim | [Complete](https://github.com/knaveightt/knaveovim) |
| Terminal | st | [Complete](https://github.com/knaveightt/st-knaveightt-void)
| Launcher | fzf+scripts | Not Started |
| Notifications | dunst | Not Started |
| Process Viewer | htop | **Complete** |

#### GUI Applications (for launching via hotkeys)
| Function | Application | Configuration Status | 
| -------- | ----------- | -------------------- | 
| Email Client | thunderbird | Not started |
| Web Browser | firefox | **Complete** |
| File Explorer | thundar | **Complete** |
| IRC Chat | kvirc | **Complete** |
| App Killer | xkill | Not Started |

#### Utility Scripts
| Function | Script Name | Configuration Status | 
| -------- | ----------- | -------------------- | 
| Shutdown | club-shutdown.sh | Not started |
| Process Kill | club-proc.sh | Not started |
| Reload WM/Key/Bar Menu | club-reload.sh | Not started |
| Configuration File Browser | club-configs.sh | Not started |
| Emoji Viewer | club-emojis.sh | Not started |
| Clipboard Viewer | club-clip-view.sh | Not started |
| Bookmark Viewer | club-bookmarks.sh | Not Started |

## Hotkeys Configured
Here is a list of hotkeys for this window manager configuration. Each key
assumes the `mod` key is also pressed as well.
- `Escape` launch Shutdown script
- `Enter` launch terminal
- `q` Quit/Kill window, `Q` *reserved for volume control*
- `w` list windows, `W` launch Web Browser
- `e` list home folders to explore, `E` launch File Explorer
- `r` choose a command to run, `R` launch IRC Chat
- `t` launch neovim, `T` launch Email Client

- `a` application launcher,  `A` launch auto-configured set of applications (TBD)
- `s` launch scratchpad #1, `S` launch scratchpad #2
- `d` toggle tiling mode (tiled,monacle), `D` or `CTRL+D` cycle to the next or prev node/window
- `f` toggle fullscreen window, `F` toggle floating window

- `z` launch Reload WM/Key/Bar Menu, `Z` lock screen 
- `x` launch process killer, `X` launch xkill
- `c` launch Emoji Viewer, `C` launch Configuration File Browser
- `v` launch Clipboard Viewer, `V` clear clipboard history
- `b` launch Bookmark Explorer, `B` toggle bar visibility

## Miscellaneous
Just posting some lemonbar links as I am highly interested in taking a minimal approach and using lemonbar + trayer as my status bar.
- [https://bios-blog.com/lemonbar.html](https://bios-blog.com/lemonbar.html)
- [https://telegra.ph/Ricing-your-nix-desktop-epI-01-18](https://telegra.ph/Ricing-your-nix-desktop-epI-01-18)
- [http://blog.z3bra.org/2014/04/meeting-at-the-bar.html](http://blog.z3bra.org/2014/04/meeting-at-the-bar.html)
