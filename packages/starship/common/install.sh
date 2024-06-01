

if command -v starship &> /dev/null; then
    echo "starship have installed already"
    exit 0
fi

$CARGO install starship --locked
