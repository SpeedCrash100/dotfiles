
function install_hyperfine() {
    if command -v hyperfine &> /dev/null; then
        echo "hyperfine have installed already"
        return 0
    fi

    $CARGO install --locked hyperfine   
}

function install_fzf() {
    if command -v fzf &> /dev/null; then
        echo "fzf have installed already"
        return 0
    fi

    $PM fzf  
}

install_fzf
install_hyperfine