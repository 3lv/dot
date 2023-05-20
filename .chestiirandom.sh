
# General use
# use \ before command to use it without alias
#

# Filter output
cat file1 - file2 # print/concat file content/std input(-)
head -n 10 # print first 10 lines
head -c 5 # print first 5 characters
tail -n 10 # print last 10 lines
tail -c 5 # print last 5 lines
# grep
grep -i -r -A 2 -B 3 -e "regex" -c
# -i case insensitive, -r recursive, -A lines after -B lines before,
# -e is optional: having marking pattern, -c count
# -l list only filenames, -o only matched string
# -n line number
# awk
git diff --numstat | awk '{print $3}' # print 3rd column of the output
awk -F ':' '{ sum += $1 }; END { print sum}' FILE # (field separator ':')
awk 'NR==3, NR==6 {print NR,$0}' FILE # print lines 3-6
# NR current line number
# NF nr of fields
# FS field separator and OFS for output
# RS record separator(line separator) ORS for output

tput setaf 196 # set color
seq -f "cazan%g" 10 -2 0 # generate sequence (usable in for)


# git
git config --global user.name "first_name last_name"
git config --global user.email "e@mail.com"
git clone https://www.github.com/3lv/dot
git init
git remote add origin url
git add file
git commit -m "commit message" 
git diff --stat #

# Process
pkill 'process name' # kill process by name

free # to check ram/swap

filefrag -v 'file' #show logical/physical_offset of extents of a file

# Boot entry
efibootmgr -v #show all boot entries
efibootmgr -b xxxx -B  #delete boot entry number 'xxxx'

# Grub
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
# config: edit /etc/default/grub and run
grub-mkconfig -o /boot/grub/grub.cfg

setxkbmap -layout us
# xmodmap to change keys
# idk how


### IMPORTANT FILES
# Information about the filesystem
# /etc/fstab


# not important
xwinwrap -ov -g 1920x1080 -- mpv -wid %WID --panscan=1.0 --no-audio --no-osc --no-osd-bar --no-input-default-bindings --loop ~/Images/Wallpapers/angel.gif
