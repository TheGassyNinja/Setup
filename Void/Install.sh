#!/bin/bash
# Void Linux Install Script
DIR="$(pwd)"

mkdir -p ~/.config ~/.local/bin ~/.local/tmp ~/Downloads ~/Pictures ~/Music ~/Videos ~/Projects ~/Bash 
cp $DIR/.bashrc ~

# Clear the screen and run the script
clear
cd $DIR
echo "Void Linux Install Script"
echo -e "Install Dir:  [ '$DIR' ]\n"

if [ -f $DIR/package.list ]; then
    echo "Installing packages from package.list"
    read -p "Continue (Y/n)?" choice
        if [ -z "$choice" ]; then
            choice="y"
        fi
    case "$choice" in
        y|Y ) echo "Installing packages";;
        n|N ) echo "Exiting"; exit 1;;
        * ) echo "Invalid"; exit 1;;
    esac
    sudo xbps-install $(grep -v "#" $DIR/package.list)

else
    echo -e "File does not exist\n  --- End of Line ---"
    exit 1
fi
sleep 1
clear
# Set up services
echo -e "\n\n Setting up services..."
echo "      #######################################################"
echo "      #       sudo ln -s /etc/sv/sshd /var/service          #"
echo "      #       sudo ln -s /etc/sv/rpcbind /var/service       #"
echo "      #       sudo ln -s /etc/sv/statd /var/service         #"
echo "      #       sudo ln -s /etc/sv/nfs-server /var/service    #"
echo "      #                                                     #"
echo "      #       sudo sv start sshd                            #"
echo "      #       sudo sv start rpcbind                         #"
echo "      #       sudo sv start statd                           #"
echo "      #       sudo sv start nfs-server                      #"
echo "      #######################################################"
sleep 3
echo ""
       sudo ln -s /etc/sv/sshd /var/service
       sudo ln -s /etc/sv/rpcbind /var/service
       sudo ln -s /etc/sv/statd /var/service
       sudo ln -s /etc/sv/nfs-server /var/service
       sleep 1
       echo ""
       sudo sv start sshd
       sudo sv start rpcbind
       sudo sv start statd
       sudo sv start nfs-server

echo -e "\n      #######################################################\n"

for service in /var/service/*; do sudo sv status "$service"; done | grep "run: "

echo -e "\n      #######################################################"




echo -e "\n\n                   --- End of Line ---"
