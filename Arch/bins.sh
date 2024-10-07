#!/bin/bash
#bins list 

#  touch ~/.local/cronlog.txt 
#  touch /home/thegassyninja/.local/tmp/weather.txt
#  touch ~/.local/tmp/updates.txt


#       # ~/.local/bin

Now-Playing.sh      -   # Rename Info-Expo  (TODO: Write simplified version (spot info and wallpaper) - Steal Template)
nsxiv-save.sh       -   # (TODO: Write monitor dir and remove old - Change ~/Pics location)
start-x.sh          -   # (TODO: Add Hyprland kill and chvt 1) - (colorize and add more WMs)
state               -   # (for bar use)
wal-theme-select.sh -   # (TODO: Add WM reloads and other app updates)
wi-fi.sh            -   # (TODO: Re-Write as rofi script) (mv to Hyprland)
x-screenshot.sh     -   # (TODO: TEST adding $MENU to bashrc) (mv $output to Images)
eq-changer          -   # (TODO: $MENU) (clean presets) (add more presets!!)
    # Not Mine
rofi-power-menu     -   #  
linkhandler         -   # Newsboat (luke smith modified)
yt-dlp              -   # YT-cli (learn more!) (BIN - NOT READABLE) (MV to etc??)


#       # ~/.local/bin/Xinit
watch-cron-log  -  # inotify cronlog.txt 
monitor-vol     -  # watch vol and notify-send on changes # (TODO: Output to tmp/Status/file)

#       # .local/bin/Crons 
*5  weather.sh - output="/home/thegassyninja/.local/tmp/weather.txt"
*30 updates.sh - output="~/.local/tmp/updates.txt"
*3  status     - Remove or re-write ??
*1  ram-mon    - Kill Firefox if ram use is 98%+ (Hulu Overflow)

# crontab -l
DISPLAY=:0;
*/5 * * * * /home/thegassyninja/.local/bin/Crons/weather.sh >> /home/thegassyninja/.local/cronlog.txt 2>&1
*/30 * * * * /home/thegassyninja/.local/bin/Crons/updates.sh >> /home/thegassyninja/.local/cronlog.txt 2>&1
*/3 * * * * /home/thegassyninja/.local/bin/Crons/status >> /home/thegassyninja/.local/cronlog.txt 2>&1
*/1 * * * * /home/thegassyninja/.local/bin/Crons/ram-mon.sh >> /home/thegassyninja/.local/cronlog.txt 2>&1

# autostarts
Qtile
BSPWM
Herbstluftwm
Hyprland
DWM
..etc







