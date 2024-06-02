
if command -v hyperfine &> /dev/null; then
    echo "hyperfine have installed already"
    exit 0
fi

$CARGO install --locked hyperfine