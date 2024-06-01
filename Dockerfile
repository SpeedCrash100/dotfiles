FROM archlinux:base

RUN pacman -Sy --noconfirm --needed sudo

RUN useradd -m docker && groupadd sudo && usermod docker -G sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY . /dotfiles

USER docker
WORKDIR /dotfiles