# Display Manager Configuration Using LightDM
> Here I describe the configuration I use to install and use lightdm in my 
>environment.

## Packages to Install
I installed the following packages from the (void linux) main repositories.
- lightdm
- lightdm-gtk3-greeter (I use this to test the display manager is working)
- lightdm-webkit2-greeter (I will actually use this with a theme)

Since I use the webkit2 greeter, I also choose to use the litarvan theme
- Go to [github](https://github.com/Litarvan/lightdm-webkit-theme-litarvan/releases)
  to get the latest tar.gz for the theme


## Installation Procedure
After installing the above packages, I needed to first disable the current 
display manager service, and enable the new service for lxdm. **Note** that 
this did kick me out into a TTY interface, but that was okay.
- `rm /var/service/lxdm`
- `ln -s /etc/sv/lightdm /var/service/`

At this point I should have a working lightdm display manager instance.
Now I need to update the lightdm config to use the webkit2 greeter, and
configure the greeter to use the desired theme.

*Additional instructions TBD*
