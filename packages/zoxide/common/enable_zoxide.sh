
which zoxide >/dev/null
if [ "$?" = "0" ]; then
    eval "$(zoxide init --cmd cd zsh)"
fi
