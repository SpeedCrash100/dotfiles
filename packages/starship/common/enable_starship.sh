
which starship >/dev/null
if [ "$?" = "0" ]; then
    eval "$(starship init zsh)"
fi
