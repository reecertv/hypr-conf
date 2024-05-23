
# for each src
for file in ./src/*
do
    DEST_DIR=$(sed -n '1 s/.*\$\([^$]*\)\$.*/\1/p' "$file")
    
    read -rp "$DEST_DIR :: Is this correct? [Y/n] " input

    if [ "${input,,}" == "n" ]; then
        echo "Next..."
    else
        cp "$file" ~/dotfiles/"$DEST_DIR"

        #CONF_DIR=$(sed -n '2 s/.*\$\([^$]*\)\$.*/\1/p' "$file")

        #sed -i "1s/.*/${HOME}/" file.txt
    fi
done

# Set

echo "Done!"