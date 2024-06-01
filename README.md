# Dotfiles
Configurations, app installation for rapid reinstalls :D

# Docker test image

Build command
```bash
docker build . -t archlinux-dotfiles-test
```

Run command
```bash
docker run --rm -it --network=host --ulimit "nofile=1024:1048576" archlinux-dotfiles-test
```