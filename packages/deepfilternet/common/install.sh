

if [ -f "${HOME}/.local/lib/ladspa/libdeep_filter_ladspa.so" ]; then 
    exit 0
fi

WORK_DIR=$(mktemp -d)

(   cd "${WORK_DIR}" \
    && git clone https://github.com/Rikorose/DeepFilterNet.git . \
    && install -D "${WORK_DIR}/target/release/libdeep_filter_ladspa.so" \
        "${HOME}/.local/lib/ladspa/libdeep_filter_ladspa.so" 

)