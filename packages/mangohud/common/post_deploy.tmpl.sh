

{{#if dotter.packages.flatpak }}

sudo flatpak override --filesystem=xdg-config/MangoHud:ro
flatpak override --user --filesystem=xdg-config/MangoHud:ro

{{/if}}