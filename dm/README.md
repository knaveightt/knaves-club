# Display Manager Configuration Using LightDM
> Here I describe the configuration I use to install and use lightdm in my 
>environment.

## Packages to Install or Download
I installed the following packages from the (void linux) main repositories.
- lightdm
- lightdm-gtk3-greeter (I use this to test the display manager is working)
- lightdm-webkit2-greeter (I will actually use this with a theme)

Since I use the webkit2 greeter, I also choose to use the Aether theme
- Go to [github](https://github.com/NoiSek/Aether) for the details

## Installation Procedure
After installing the above packages, I needed to first disable the current 
display manager service, and enable the new service for lxdm. **Note** that 
this did kick me out into a TTY interface, but that was okay.
- `rm /var/service/lxdm`
- `ln -s /etc/sv/lightdm /var/service/`

At this point I should have a working lightdm display manager instance.
Now I need to update the lightdm config to use the webkit2 greeter, and
configure the greeter to use the desired theme.
- Update `/etc/lightdm/lightdm.conf` by changing `greeter-session=` to equal 
  lightdm-webkit2-greeter

The theme I use is the Aether theme. To use this theme, the following steps
need to be performed:
- `git clone git@github.com:NoiSek/Aether.git`
- `sudo cp --recursive Aether /usr/share/lightdm-webkit/themes/Aether`
- Edit /etc/lightdm/lightdm-webkit2-greeter.conf and set theme to Aether


