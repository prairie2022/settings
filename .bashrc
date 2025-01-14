# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"

# alias
export wst="b13902105@ws4.csie.ntu.edu.tw"
alias diary="sudo veracrypt ~/Desktop/diary.hc"
alias sync_psweb="rclone sync ~/Desktop/remote/htdocs psweb: --progress --track-renames"
alias desk="cd ~/Desktop"

# cycle through completion
# https://stackoverflow.com/a/51732355
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'

# source .bashrc
