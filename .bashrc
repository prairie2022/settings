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
alias coding="cd ~/Desktop/code/ && ls"
alias cp="cp -i" # preventing overwrite
alias mv="mv -i"

# cycle through completion
# https://stackoverflow.com/a/51732355
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'

# timestamp
# https://www.onejar99.com/mac-linux-terminal-bash-prompt-html/
export PS1='\[\033[0;33m\][\t]\[\033[00m\] \[\033[0;92m\]\w\[\033[00m\]\$ '
export HISTTIMEFORMAT="%F %T "

# source .bashrc
