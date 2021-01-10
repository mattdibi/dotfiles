#! /bin/bash

CURRENT_EXE=/usr/bin/nvim
BACKUP_EXE=/usr/bin/old.nvim

echo ""
echo " ███    ██ ███████  ██████  ██    ██ ██ ███    ███ "
echo " ████   ██ ██      ██    ██ ██    ██ ██ ████  ████ "
echo " ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ "
echo " ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ "
echo " ██   ████ ███████  ██████    ████   ██ ██      ██ "
echo "                                  Appimage updater "
echo ""

echo "Updating nvim.appimage"
read -s -p "Enter Password for sudo: " sudoPW
echo ""

echo "Downloading..."
curl -sSLO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage

NEW_VER="$(./nvim.appimage --version | head -n 1)"
echo "Downloaded version: $NEW_VER"
echo ""

# Check if NeoVIM is already installed
if [[ -f "$CURRENT_EXE" ]]; then
    CURRENT_VER="$($CURRENT_EXE --version | head -n 1)"
    echo "Currently installed version: $CURRENT_VER"

    # Check if versions match
    if [ "$NEW_VER" = "$CURRENT_VER" ]; then
        echo "Most recent version is already installed. Quitting..."
        rm nvim.appimage
        exit 0
    fi

    # Backup older version
    echo "Backing up current version to $BACKUP_EXE."
    echo $sudoPW | sudo cp nvim.appimage $BACKUP_EXE
else
    echo "No NeoVIM binary found in $CURRENT_EXE."
fi

echo "Installing binary to $CURRENT_EXE"
echo $sudoPW | sudo mv nvim.appimage $CURRENT_EXE
echo ""

echo "Update complete."
echo ""
