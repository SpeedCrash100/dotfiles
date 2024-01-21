
if command -v paru &> /dev/null; then
    echo "paru have installed already"
    echo "$(which paru)" > "/tmp/PM"
    exit 0
fi


WORKDIR=$( mktemp -d )

echo "pacman -S --noconfirm rustup bat devtools"
sudo pacman -S --noconfirm rustup bat devtools

(   \
    cd "${WORKDIR}" && \
    git clone "https://aur.archlinux.org/paru.git" . && \
    makepkg -si --noconfirm )


echo "$(which paru)" > "/tmp/PM"

