
LIB32_AVAILABLE=$(cat /etc/pacman.conf | grep '^\[multilib\]' | wc -l)
if [ $LIB32_AVAILABLE -gt 0 ]; then
    echo "multilib is enabled"
    if [ -r "/usr/lib32/libgamemode.so" ]; then 
        echo "lib32-gamemode have installed"
    else
        $PM lib32-gamemode
    fi
fi



if command -v gamemoderun &> /dev/null; then
    echo "gamemoderun have installed already"
    exit 0
fi


$PM gamemode

sudo usermod -aG gamemode $USER