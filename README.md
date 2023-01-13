# Knave's C.L.U.B.
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
| Window manager | bspwm | 50% Complete |
| Hotkey setup | sxhkd | 50% Complete |
| Bar | lemonbar | 10% Complete |
| Editor | neovim | [Complete](https://github.com/knaveightt/knaveovim) |
| Terminal | st | [Complete](https://github.com/knaveightt/st-knaveightt-void)
| Launcher | fzf+scripts | 80% Complete |
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
| Run Dialog | kc-run | 90% Complete |
| Shutdown | kc-shutdown | Not started |
| Process Kill | kc-proc | Not started |
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
- `q` Quit/Kill window, `Q` *reserved for volume control*
- `w` list windows, `W` launch Web Browser
- `e` list home folders to explore, `E` launch File Explorer
- `r` choose a command to run using `kc-run`, `R` launch IRC Chat
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
- [https://www.linuxjournal.com/content/using-named-pipes-fifos-bash](https://www.linuxjournal.com/content/using-named-pipes-fifos-bash)
- [https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/melonbar](https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/melonbar)
- [https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/statusline](https://github.com/simonhughxyz/dotfiles/blob/master/lemonbar/.local/bin/statusline)
- [https://github.com/JLErvin/dotfiles/blob/master/scripts/simplebar](https://github.com/JLErvin/dotfiles/blob/master/scripts/simplebar)
- [here is a link to some workarounds resizing lemonbar with a dynamic system tray](https://github.com/LemonBoy/bar/issues/182)

Also, there are things I will want to remember to document in this repo:
- Any additional programs that are referenced in my scripts or configs
- How I choose to theme programs that are not directly themed by these configs including
  - any GTK / QT theming
- Profile specific files like
  - .bashrc
  - .Xresources
