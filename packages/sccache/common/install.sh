
if command -v sccache &> /dev/null; then
    echo "sccache have installed already"
    exit 0
fi

$CARGO install --locked sccache