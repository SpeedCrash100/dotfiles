

if command -v zoxide &> /dev/null; then
    echo "zoxide have installed already"
    exit 0
fi

$CARGO install zoxide --locked
