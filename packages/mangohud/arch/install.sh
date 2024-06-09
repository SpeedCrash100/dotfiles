


LIB32_AVAILABLE=$(cat /etc/pacman.conf | grep '^\[multilib\]' | wc -l)
if [ $LIB32_AVAILABLE -gt 0 ]; then
    echo "multilib is enabled"
    $PM lib32-mangohud
fi



if command -v mangohud &> /dev/null; then
    echo "mangohud have installed already"
    exit 0
fi


$PM mangohud goverlay
