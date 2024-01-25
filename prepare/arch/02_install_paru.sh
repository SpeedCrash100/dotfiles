
if command -v paru &> /dev/null; then
    echo "paru have installed already"
    echo "$(which paru) -S --noconfirm --needed" > "/tmp/PM"
    exit 0
fi


WORKDIR=$( mktemp -d )

echo "pacman -S --noconfirm bat devtools"
sudo pacman -S --noconfirm bat devtools

(   \
    cd "${WORKDIR}" && \
    git clone "https://aur.archlinux.org/paru-bin.git" . && \
    makepkg -si --noconfirm )


echo "$(which paru) -S --noconfirm --needed" > "/tmp/PM"

