

echo "Setting shell to zsh..."
ZSH_EXE="$(which zsh)"
if [ $? -eq 0 ]; then
    chsh -s "${ZSH_EXE}"
else
    echo "Failed to set default shell" 1>&2;
fi


