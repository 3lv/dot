xwinwrap -ov -g 1920x1080 -- mpv -wid %WID --panscan=1.0 --no-audio --no-osc --no-osd-bar --no-input-default-bindings --loop ~/Images/Wallpapers/angel.gif

xwinwrap -ov -g 1920x1080 -- mpv -wid %WID --fs --panscan=1.0 --no-audio --no-osc --no-osd-bar --no-input-default-bindings --loop ~/Images/Wallpapers/angel.gif

# General use
# use \ before command to use it without alias
#



# Boot entry
efibootmgr -v #show all boot entries
efibootmgr -b xxxx -B  #delete boot entry number 'xxxx'

# Process
pkill 'process name' # kill process by name
