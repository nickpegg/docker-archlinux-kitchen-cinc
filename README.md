# archlinux-kitchen-cinc

An archlinux Docker image suitable for running test-kitchen tests with, using
Cinc instead of Chef.

Customizations over the vanilla `archlinux` image;
* Install `openssh` and enable it
* Run systemd by default - required for Chef testing of services
* Install `cinc` from AUR
