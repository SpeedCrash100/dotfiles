
which ccache >/dev/null
if [ "$?" = "0" ]; then
    ccache -M 25 >/dev/null
fi

