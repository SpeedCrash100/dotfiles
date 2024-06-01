
if [ -d "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "zsh-autosuggestions have been installed"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi