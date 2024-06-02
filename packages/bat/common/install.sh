
if command -v bat &> /dev/null; then
    echo "bat have installed already"
    exit 0
fi

$CARGO install --locked bat