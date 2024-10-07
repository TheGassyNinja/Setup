#!/bin/bash
# This script is meant to be run after a fresh install of Arch Linux - Xorg
# It will install the necessary packages and configure the system
# set -x
# Check for vim and install if needed
if ! command -v vim &> /dev/null; then
    echo "Vim is not installed. Installing..."
    sudo pacman -S vim
fi
EDITOR="/usr/bin/vim"

# mkdirs (Downloads, Git, Projects, Music, Videos, Pictures, Documents)
mkdir -p ~/Downloads ~/Git ~/Projects ~/Music ~/Videos ~/Pictures ~/Documents
# Create the directories for mounting NFS shares
mkdir -p ~/mnt/DataT ~/mnt/Data3 ~/mnt/USB


# Install necessary packages
    # check for package.txt file and give option to edit it
    # check for yay and install it if not present
    # check for yay packages and install them
    # Check for package.txt file and give option to edit
    if [ -f package.txt ]; then
        echo "package.txt file found."
        echo "Remove the # from the beginning of the lines to install the packages."
        echo ""
        read -p "Do you want to edit the package.txt file? (y/n): " choice
        if [ "$choice" == "y" ]; then
            $EDITOR package.txt
            clear
            # echo package list (packages without #) and confirm before installing
            echo "The following packages will be installed:"
            grep -v "#" package.txt
            read -p "Do you want to continue with the installation? (y/n): " choice
            if [ "$choice" == "y" ]; then
                clear
                sudo pacman -S --needed $(grep -v "#" package.txt) && sleep 2 && clear
            fi
        else
            clear
            # echo package list (packages without #) and confirm before installing
            echo "The following packages will be installed:"
            grep -v "#" package.txt
            read -p "Do you want to continue with the installation? (y/n): " choice
            if [ "$choice" == "y" ]; then
                clear
                sudo pacman -S --needed $(grep -v "#" package.txt) && sleep 2 && clear
            fi
        fi

    else
        echo "package.txt file not found."
    fi

working_dir=$(pwd)

# Install yay
if ! command -v yay &> /dev/null; then
    echo "Yay is not installed. Installing..."
    cd ~/Git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
else
    echo "Yay is already installed."
fi

cd $working_dir

# Check for AUR.txt file and give option to edit
if [ -f AUR.txt ]; then
    	echo "AUR.txt file found."
    	echo "Remove the # from the beginning of the lines to install the AUR packages."
    	echo ""
    	read -p "Do you want to edit the AUR.txt file? (y/n): " choice
    if [ "$choice" == "y" ]; then
          $EDITOR AUR.txt
    	  # echo AUR package list (packages without #) and confirm before installing
    	  echo "The following AUR packages will be installed:"
    	  grep -v "#" AUR.txt
    	  read -p "Do you want to continue with the installation? (y/n): " choice
        if [ "$choice" == "y" ]; then
            yay -S --needed $(grep -v "#" AUR.txt)
        fi
    fi

    echo "AUR.txt file not found."
fi

# Start and enable services
# Check for services.txt file and give option to edit
if [ -f services.txt ]; then
    echo "services.txt file found."
    echo "Remove the # from the beginning of the lines to enable the services."
    echo ""
    read -p "Do you want to edit the services.txt file? (y/n): " choice
    if [ "$choice" == "y" ]; then
        $EDITOR services.txt
        clear
        # echo service list (services without #) and confirm before enabling
        echo "The following services will be enabled:"
        grep -v "#" services.txt
        read -p "Do you want to continue with the enabling? (y/n): " choice
        if [ "$choice" == "y" ]; then
            clear
            sudo systemctl enable --now $(grep -v "#" services.txt) && sleep 2 && clear
        fi
    else
        clear
        # echo service list (services without #) and confirm before enabling
        echo "The following services will be enabled:"
        grep -v "#" services.txt
        read -p "Do you want to continue with the enabling? (y/n): " choice
        if [ "$choice" == "y" ]; then
            clear
            sudo systemctl enable --now $(grep -v "#" services.txt) && sleep 2 && clear
        fi
    fi

else
    echo "services.txt file not found."
fi

systemctl list-units --type=service --state=running

sleep 5

# Offer to copy dotfiles
clear
echo "Do you want to copy dotfiles? (Y/n)"
read choice
if [ "$choice" == "Y" ]; then
    echo "Copying dotfiles..."
    sleep 1 ; mc ~/.config $working_dir
    # Copy dotfiles
    echo "Dotfiles copied."
fi

echo -e "\n\n\n"
echo "Install TPM and Tmux plugins? (Y/n)"
read choice
if [ "$choice" == "Y" ]; then
    echo "Installing TPM and Tmux plugins..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM and Tmux plugins installed."
fi


echo -e "\n\n\n"
echo "Check vim plugins? (Y/n)"
read choice
if [ "$choice" == "Y" ]; then
    echo "Checking vim plugins..."
    vim +PlugInstall +qall
    echo "Vim plugins checked."
fi
sleep 2
clear
echo -e "\n\n\n"
echo "ADD HERE - Reboot at this point? (Y/n)"
# read choice
# if [ "$choice" == "Y" ]; then
#     sudo reboot
# fi











# Git configurations
#cd ~/Git
#git clone https://github.com/thegassyninja/arch-dots
#cd arch-dots
# cp files to appropriate directories










