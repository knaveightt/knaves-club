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
| Configuration File Browser | club-configs.sh | Not started |
| Emoji Viewer | club-emojis.sh | Not started |
| Clipboard Viewer | club-clip-view.sh | Not started |
| Bookmark Viewer | club-bookmarks.sh | Not Started |

## Hotkeys Configured
Here is a list of hotkeys for this window manager configuration. Each key assumes the `mod` key is also pressed as well.
- `q` launch neovim, `Q` launch Email Client
- `w` list windows, `W` launch Web Browser
- `e` list home folders to explore, `E` launch File Explorer
- `r` choose a command to run, `R` launch IRC Chat
- `t` launch terminal, `T` launch htop

- `a` application launcher,  `A` launch auto-configured set of applications (TBD)
- `s` launch scratchpad #1, `S` launch scratchpad #2
- `d` change dynamic window tiling mode #1, `D` change dynamic window tiling mode #2
- `f` toggle fullscreen window, `F` toggle floating window

- `z` lock screen, `Z` launch Shutdown script
- `x` kill window, `X` launch xkill
- `c` launch Emoji Viewer, `C` launch Configuration File Browser
- `v` launch Clipboard Viewer, `V` clear clipboard history
- `b` launch Bookmark Explorer, `B` toggle bar visibility


