

if [ -x "$HOME/.local/opt/python/bin/python" ]; then
    echo "User python env exists"
    exit 0 
fi

mkdir -p "$HOME/.local/opt/python"
$PYTHON -m venv "$HOME/.local/opt/python"