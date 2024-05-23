#

REPO_URL="http://github.com/reecertv/..."
TEMP_DIR=$(mktemp -d)

git clone "$REPO_URL" "$TEMP_DIR"

if [ $? -ne 0 ]; then
    echo "Failed to clone the repo."
    exit 1
fi

# for each src
for file in "$TEMP_DIR"
do
    DEST_DIR=$(sed -n '1s/.*\$\$\([^$]*\)\$\$.*/\1/p' "$file")
    
    read -rp "$DEST_DIR :: Is this correct? [Y/n] " input

    if [ "${input,,}" == "n" ]; then
        exit 1
    fi

    mkdir -p "$DEST_DIR"
    cp "$file" "$DEST_DIR"
done