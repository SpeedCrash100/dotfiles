# Dotfiles
Configurations, app installation for rapid reinstalls :D

# Repository structure
  * .dotter - dotter files for deployment
  * prepare - scripts for preparing the host system
  * packages - installable packages when selected by dotter
  * config - config location
  * deploy.sh - entrypoint for config deploy

# Docker test image

Build command
```bash
docker build . -t archlinux-dotfiles-test
```

Run command
```bash
docker run --rm -it --network=host --ulimit "nofile=1024:1048576" archlinux-dotfiles-test
```