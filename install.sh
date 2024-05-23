
# for each src
for file in ./src/*
do
    DEST_DIR=$(sed -n '1 s/.*\$\([^$]*\)\$.*/\1/p' "$file")
    
    read -rp "$DEST_DIR :: Is this correct? [Y/n] " input

    if [ "${input,,}" == "n" ]; then
        exit 1
    fi

    cp "$file" ~/dotfiles/"$DEST_DIR"
done

echo "Done!"