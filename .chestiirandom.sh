exit
# TODO
# nvim: fix colorscheme ttyscheme 		DONE
# nvim: implement screenkeys plugin using:	DONE
# typer: implement linked lists with root	----
# fix: screenkeys < displays as <lt>		DONE

# Reproduce system
curl https://3lv.github.io | sudo sh

# tty commands
# (most of these require sudo)
showconsolefont # prints ?all characters forming the font
setterm --dump --file cazan.dump # copy of all characters on screen defaults to file screen.dump
# stop the screen when logged in in tty
setterm --blank 1
# for remote usage (with ssh)
TERM=linux setterm --blank 1 >/dev/tty1 </dev/tty1
# cat /dev/fb0 > fbdump.raw # framebuffer raw file (needs conversion)
fbgrab screenshot.png # framebuffer to png
tty # prints current tty or pseudo terminal
chvt 2 # change to tty2
fgconsole # (number of used vts, --next-available)
deallocvc # get rid of ?unused vts

DISPLAY=:0 firefox # start firefox in active xsession

# VIM {{{

# :lua print(vim.inspect(vim.api.nvim_list_uis()))
# :lua for _, ui in pairs(vim.api.nvim_list_uis()) do print(ui.chan .. ui.term_name) end
# :lua for _, ui in pairs(vim.api.nvim_list_uis()) do if ui.chan and not ui.stdout_tty then vim.fn.chanclose(ui.chan) end end
# :call chanclose(id)
# nvim --server /tmp/nvim.pipe --remote-send "<c-\><c-n>:tc $PWD<cr>"
# change server pipe
# :call serverlist()
# :call serverstop(v:servername)
# :call serverstart('/tmp/nvim.pipe')

# get this into muscle memory
mK[chwin]mL'K[rewin]'L
# Quickfix List
# <cr> " jump to error
# <c-w><cr> " open new window and jump there
# :cl [from] [, [to]] " list errors
# :chi " quickfix list history
# :col
# cnew
# > Quickfix Window
# :cope [height]
# :ccl
# :cw " open quickfix window when there are recognized errors or else close
# :cbo " jump to bottom error in quickfix list
# > Quickfix List Movement
# # relative jumps
# :cc [nr] " jump to current error
# :cn
# :cp
# :caf " after the cursor
# :cbe " before the cursor
# :cbel " below the current line
# :cabo " above the current line
# :cnf " next file
# # absolute jumps
# :cr " first (:cfir)
# :cla
# > Edit Quickfix List
# :cf [errorfile] read the error file and jump to the first error
# :caddf [errorfile]
# :make
# :vim /pattern/[fjg]
# :helpg pattern@fr
# :gr /pattern/ " same as make but use grepprg(grep -n)
# random stuff
:tabr :tabl
:tabm [+-]N
:redir > file # redir all command output to file/register (not that useful)
#:redir @">
#:redir END
'cpoptions' # take a deeper look into these options
:[range]t {address} # copy specified text
:[range]m {address} # move specified text
:set list # display space characters
z{nr}<CR> # set window height to {nr}
:enew # new buffer
# regex
# \zs(match)\ze
# :#
# :g/^\s*#/.,/^\s*[^#]/-1j
# super tare cazan aa aa cazan super super super
# /^.\{-}\zstext # first occurance of text
# /\(text\)\ze\(\1\@!.\)*$ # last occurance text
# int MihneaCazan cazan mihnea super
# # Patterns
# \%<23l
:help :_%
# }}}

# Bash shortcuts {{{
#
## History
# Ctrl+R: grep history
# !n  #n is from history
# !-n  #nth previous command
# !prefix of command
# !?string   #previous command matching string
# ^string1^string2^   #repeat the last command, replacing string1 with string1
#
## Controlling the screen
# Ctrl+L: Clear the screen. This is similar to running the "clear" command.
# Ctrl+S: Stop all output to the screen
# Ctrl+Q: Resume output to the screen after stopping it with Ctrl+S.
# 
## Moving the Cursor
# Ctrl+A: Go to the beginning of the line.
# Ctrl+E: Go to the end of the line.
# Alt+B: Go left (back) one word.
# Ctrl+B: Go left (back) one character.
# Alt+F: Go right (forward) one word.
# Ctrl+F: Go right (forward) one character.
# Ctrl+XX: Move between the beginning of the line and the current position of the cursor.
# 
## Deleting Text
# Ctrl+D or Delete: Delete the character under the cursor.
# Alt+D: Delete all characters after the cursor on the current line.
# Ctrl+H or Backspace: Delete the character before the cursor.
# 
## Fixing Typos
# Alt+T: Swap the current word with the previous word.
# Ctrl+T: Swap the last two characters before the cursor with each other. You can use this to quickly fix typos when
#   you type two characters in the wrong order.
# Ctrl+_: Undo your last key press. You can repeat this to undo multiple times.
# 
## Cutting and Pasting
# Ctrl+W: Cut the word before the cursor, adding it to the clipboard.
# Ctrl+K: Cut the part of the line after the cursor, adding it to the clipboard.
# Ctrl+U: Cut the part of the line before the cursor, adding it to the clipboard.
# Ctrl+Y: Paste the last thing you cut from the clipboard. The y here stands for "yank".
#
# Ctrl X E to edit command in editor
## General use
# use \ before command to use it without alias
#
# }}}

# Filter output {{{
cat file1 - file2 # print/concat file content/std input(-)
head -n 10 # print first 10 lines
head -c 5 # print first 5 characters
tail -n 10 # print last 10 lines
tail -c 5 # print last 5 lines
# grep
grep -i -r -A 2 -B 3 -e "regex" -c
# -i case insensitive, -r recursive, -A lines after -B lines before, -5 context lines
# -e is optional: having marking pattern, -c count
# -l list only filenames, -o only matched string
# -n line number
# awk
awk '{print $3}' # print 3rd column of the output
awk -F ':' '{ sum += $1 }; END { print sum}' FILE # (field separator ':')
awk 'NR==3, NR==6 {print NR,$0}' FILE # print lines 3-6
awk '{if(\$1=="onionlinks")print \$2}'
cat /usr/share/nvim/runtime/doc/index.txt | awk '{FS = "\t"; n = 0; for(i = 1; i <= NF; i+ +) if(length($i) != 0) v[++n] = $i;; if(n == 3) print v[1], "\t", v[2], "\t", v[3]; else if(n == 1 && NF == 5) print v[ 1]}'
# NR current line number
# NF nr of fields
# FS field separator and OFS for output
# RS record separator(line separator) ORS for output
seq -f "cazan%g" 10 -2 0 # generate sequence (usable in for)
sed '7r /dev/stdin' main.py -ibakupfile # read from stdin/file after line 7
sed -n '4,$p' main.py # (-n print only once)
sed '2{H;d};3{p;x;s/^\n//}' # move line 2 after line 3
# }}}

# Terminal info stuff, not useful {{{
tput lines # the number of lines/cols
tput cup 0 0 # moves cursor at 0 0
tput setaf 196 # set color
tput sc # save coords
tput rc # restore coords
stty -echo; echo -e "\033[6n"; read -d \[ x; read -d R x; stty echo; echo $x # cooking the current coords
# }}}

### git {{{
## initialize git
git config --global user.name "first_name last_name"
git config --global user.email "e@mail.com"
git clone https://www.github.com/3lv/dot
git init # (create new git repo)
git remote add origin url # (add origin variable for easier push)
## basic usage
git add file # git status #to check the added files (-A all files)
git rm file # (-r for dir)
git rm --cached file # (untrack file)
git commit -m "commit message" 
git push origin master
# add extra staged files to commit
git commit --amend
## branches
git branch # list all branches
git branch branch_name # creates new branch
git branch -d branch_name # deletes branch
git checkout branch_name # move to different branch (-b also creates the branch)
git merge branch_name # merge branch_name into current branch
# merge conficts result in a file that has
#
# <<<<<<< HEAD
# changes in HEAD(current branch)
# =======
# changes in branch_name(the branch i am merging with)
# >>>>>>> branch_name
#
# to solve the conflicts update the file and commit the final file
#
# OR can abort the merge with:
git merge --abort
## info
git status -sb # (-s short, -b show branch even in short status)
git log --oneline # (history of commits, --oneline for shorter list)
git diff --stat #
git diff branch1..branch2
git diff --color=always | less -r # use alternate buffer for displaying diff
# git diff --numstat | awk '{print $3}' # prints modified files from shortened diff
## undo
git reflog
git checkout "commit-SHA"
git cherry-pick "commit-SHA"
git revert HEAD # (revert commit creating a new commit)
git reset --hard
#
#
git fetch origin master
git reset --hard origin/master
# WIP
# }}}

# command dump {{{
rm # (-i interactive)
man
whatis
help cd # for shell built in (for/ return etc., man builtins)
which #(whereis for all)
tail -f # shows everything that s appended to the file
less +F # less and follow how file changes (-r ?read?interpret color codes)
cat -n
wc # lines words bytes (-l, -w, -c,  -m for chars)
sort # (-r, -n, -u unique, -f case insensitive, -h human readable size format)
uniq # (adjacent lines,-u unique lines, -d duplicates, -c count)
truncate -s 0 # truncate files to size 0
# expansions
# * all file names
# ? any char
# cazan.{txt,cpp,hpp}
# {1..99..2}
diff # (-y line by line, -u lines of context default=3)
find # (-name '*cazan*.rb', -type d/f, -iname insensitive, -or, -not, -size +100c -size -1M, -mtime -1 (modify time, last day), -mmin +10, -atime (acces time), -perm 777, -maxdepth 1, -exec cat {} +)
grep 'cazan' cazan.txt # ( -n, -C 3 context, -r rec, -E regex)
du # disk usage for files ( -m MB format, -g GB, -h human readable)
df # mounted partitions, filesystems sizes (-h hr^, can pass file and shows the specific partition)
history # ( can use !num afterwords)
ps # process status (ax all processes, aux, | grep procname, -t /dev/tty2 by tty name)
top # ( -o mem sort by memory usage, )
kill # (-l list SIGCODES)
killall name
jobs # list all jobs
fg/bg
gzip # ( -k keep file, -d decompress)
tar # ( archive, -c create, -x extract, -t view files, -f inoroutput, -C directory for extraction, -z also zip, note: extract extracts an compressed archive into the files; -czf to compress, -xf to uncompress)
xargs # stdin to command args (ex: find . -size +1M | xargs ls -lh)
ln -s # (create symbolic link)
su user # login as user ( - log in as user(changes dir etc)
chown user:group file # ( -R rec )
chmod o+x # ( others can execute u/g/o/a +/-/= r/w/x
uname -a # (system information)
ip addr show
netstart # ( check for ports (run with sudo) -tulpn)
mount # ( device mountpoint )
sed '1,$ s/oldstring/newstring/nthoccurance(3g from third)' file # ( -n /p flag prints only matched lines, /d delete line, '3,5d' deletes lines in range, -r for regex)
uptime
wall "message"
write user
mesg y # (receive messages)
useradd cazan
passwd
bc # calculator
nice -n 19 # change the niceness(priority) of a program
wget
curl # (-i extra info, -d "first=Corey&last=Schafer" POST reauest, -X PUT/DELETE, -u user:pass, -o outputfile)
netcat -l port > output.txt
cat filetosend | netcat 192.168.0.49 port -q 0
nl # number lines
cat -n filename # (-b nonblank lines)

systemctl start service@user
xxd # to view binary
strings # prints ascii strings from binary
objdump -d -Mintel # binary to assembly
reset # resets shell
#useless commands v
tr # (replaces characters with other, "!" ".",  [a-z] [A-Z] make text uppercase, -d delete, -s squeeze repeating)
cut # (-b by bytes ex: -b 5-10,20-30, -c, -d delimiter, -f field; ex cut -d ' ' 2,3)
id # uid groupid and groups
# }}}

# pacman{{{
sudo pacman -Syu
sudo pacman -Sy archlinux-keyring
sudo pacman-key --refresh-keys
sudo pacman -Ssq "regex"
# }}}

# make
make -C dir # (-f file, -B force remake of all targets)
# from vim
# :setl mp=make\ -Cbuild
# :let &mp='g++ -o %< %'

# Plot graph with gnuplot
# in terminal
cat plot.dat | gnuplot -p -e 'set terminal dumb size 240, 64; plot "-" using 1:2 with lines notitle'
cat plot.dat | gnuplot -p -e 'plot "-" using 1:2 with lines notitle; pause -1'
gnuplot --slow -e "plot \"$PWD/plot.data\" using 1:2 with lines; pause -1"
gnuplot -e "set terminal dumb size $(tput cols), $(tput lines); plot \"plot.data\" using 1:2 with lines; pause -1"
gnuplot --slow -p -e 'plot "plot.dat" using 1:2 with lines; pause -1'
# using "Age":"Height"

# Interact with services (daemons)
systemctl start
# stop/enable/disable

# Process
pgrep -lP PID # list child process
pkill 'process name' # kill process by name
pkill -s PID # kill process by pid
pkill -9 # send SIGKILL instead of SIGTERM
# process status
ps -U USER # list all processes owned by user "USER"
ps --ppid PID # list child processes of PID
#systemctl kill -s HUP systemd-logind

# Ports
sudo ss -tulpn # list all opened ports
sudo iptables -S # list current rules
sudo iptables -P FORWARD DROP

# Sudo
sudo -k
faillock --user vlad --reset

# Wifi
iwctl
station wlan0 connect <"netowork name"> [security]

# Keyboard
# xmodmap to change keycodes
xmodmap -pke # to find keycodes
xmodmap -e "keycode $keycode = 0x0000" #disable a key
xmodmap -e "keycode 46 = ;" #change 'l'(46) to semicolon
# /usr/share/kbd/keymaps to find keymaps and add custom
# /etc/vconsole.conf for persistent custom keymap
setxkbmap -layout us
# change keyboard rate/delay
# for tty
kbdrate -r 10.9 -d 250
# for x
# aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
# aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
# aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
xset r rate 250 30 # equiv to tty speed
xset r rate 200 50
kbdrate [-d delay] [-r rate]
# copy file content to clipboard
cat file_name | xsel -ib

fdisk -l #list partition table
fdisk # change partition table

# format partition
mkfs.exfat -n xd /dev/sda1 # best

free # to check ram/swap
filefrag -v 'file' #show logical/physical_offset of extents of a file
# Boot entry
efibootmgr -v #show all boot entries
efibootmgr -b xxxx -B  #delete boot entry number 'xxxx'

# Grub
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
# config: edit /etc/default/grub and run
grub-mkconfig -o /boot/grub/grub.cfg


# Assembly
nasm -f elf64 -o app.o app.asm && ld -o app app.o # compile and link
objdump -d -Mx86-64,intel MAIN # see MAIN binary as assembly code

gbd MAIN # run debugger (compile with -g flag before)

bear -- make # generates a compile_commands.json (used by ccls lsp)


### IMPORTANT FILES
# Information about the filesystem
# /etc/fstab
# Process info
# /proc/PID/task # directory for each thread of the process (can find child processes)

# mysql
mariadb -e "show variables like 'datadir'"
# sql: "ALTER TABLE global_messages CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;"

# create ssl key
openssl req -x509 -newkye rsa:4096 -keyout key.pem -out cert.pem -days 365

# i3
i3-msg "[workspace=2] kill"

# video background
xwinwrap -ov -g 1920x1080 -- mpv -wid %WID --panscan=1.0 --no-audio --no-osc --no-osd-bar --no-input-default-bindings --loop ~/images/wallpapers/angel.gif

# Windows{{{
In powershell $Env:USERPROFILE is equiv to %USERPROFILE% for cmd
# }}}

# vi:fdm=marker:ft=sh:
