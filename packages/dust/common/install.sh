
if command -v dust &> /dev/null; then
    echo "dust have installed already"
    exit 0
fi

$CARGO install --locked du-dust