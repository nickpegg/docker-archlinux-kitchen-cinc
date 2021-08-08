FROM archlinux

RUN pacman --noconfirm -Syu

# Install and enable openssh daemon
RUN pacman --noconfirm -S systemd openssh
RUN ssh-keygen -A
RUN systemctl enable sshd.service

# Make and install Cinc
RUN pacman --noconfirm -S base-devel git
RUN sudo -u nobody git clone https://aur.archlinux.org/cinc.git /tmp/cinc-build
WORKDIR /tmp/cinc-build
RUN sudo -u nobody makepkg
RUN pacman -U --noconfirm cinc*.pkg.*
# Hack to get rid of XCRYPT errors in recent Cinc
RUN ln -s /usr/lib/libcrypt.so.2 /opt/cinc/embedded/lib/libcrypt.so.1
WORKDIR /
RUN rm -r /tmp/cinc-build

CMD /usr/lib/systemd/systemd
