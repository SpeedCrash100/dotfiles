
cp "${BASE_DIR}/packages/${PACKAGE_NAME}/common/.zshrc" "$HOME/"

echo "Setting shell to zsh..."
ZSH_EXE="$(which zsh)"
sudo usermod --shell "${ZSH_EXE}" "$(id -nu $UID)"


