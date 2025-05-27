setenv SSH_ENV $HOME/.ssh/environment

fish_default_key_bindings
fish_vi_key_bindings --no-erase insert

function start_agent
    ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
    chmod 600 $SSH_ENV
    . $SSH_ENV >/dev/null
    ssh-add
end

function check_idents
    ssh-add -l | grep "The agent has no identities" >/dev/null
    if [ $status -eq 0 ]
        ssh-add

        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent >/dev/null
    if [ $status -eq 0 ]
        check_idents
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV >/dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent >/dev/null
    if [ $status -eq 0 ]
        check_idents
    else
        start_agent
    end
end

set -g CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -g RUST_BACKTRACE 1
## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# ssh-agent
# if not pgrep --full ssh-agent | string collect > /dev/null
#   eval (ssh-agent -c)
#   set -Ux SSH_AGENT_PID $SSH_AGENT_PID
#   set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
# end

## Export variable need for qt-theme
if type qtile >>/dev/null 2>&1
    set -x QT_QPA_PLATFORMTHEME qt5ct
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.cargo/bin to PATH
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end
# Add ~/.bin to PATH
if test -d ~/.bin
    if not contains -- ~/.bin $PATH
        set -p PATH ~/.bin
    end
end

# Add ~/go/bin to PATH
if test -d ~/go/bin
    if not contains -- ~/go/bin $PATH
        set -p PATH ~/go/bin
    end
end

# Add ~/.emacs.d/bin to PATH
if test -d ~/.emacs.d/bin
    if not contains -- ~/.emacs.d/bin $PATH
        set -p PATH ~/.emacs.d/bin
    end
end

# Add ~/.cargo/bin to PATH
# if test -d ~/.cargo/bin
#     if not contains -- ~/.cargo/bin $PATH
#         set -p PATH ~/.cargo/bin
#     end
# end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

## Starship prompt
if status --is-interactive
    source ("/usr/bin/starship" init fish --print-full-init | psub)
end

## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons' # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'" # show only dotfiles
alias ip="ip -color"

# My aliases

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short' # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl" # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

alias about="neofetch"

# like `tmux` but in Rust and with help :)
alias rmux="zellij"

# Benchmark cli commands
alias bench-cli="hyperfine"

# HTML query tool
alias htmlfind="htmlq"

# JSON query tool, use like `jql '"scripts".' package.json`
alias json-find="jql"

# Serve a folder over http quick
alias serve-files="miniserve"

# Save web page as a single html file with all embeded
alias save-page="monolith"
alias crawl="monolith"

# Shows you disk usage stats
alias disk-usage="ncdu"

# Finds duplicate files
alias duplicates-finder="rmlint"

# Youtube downloader
alias youtube-dl="yaydl"
alias ytdl="yaydl"

alias calc="fend"
alias calculator="fend"
alias procs="mprocs -c ~/.config/mprocs/mprocs.yaml"
alias procsn="mprocs --npm"
alias pomw="porsmo pomodoro custom '25:00' '05:00' '20:00'"
alias poms="porsmo pomodoro custom '10:00' '01:00' '05:00'"

# NeoVim
alias nvchad="NVIM_APPNAME=NvChad nvim"
alias nv-chad="nvchad"

alias astronvim="NVIM_APPNAME=AstroNvim nvim"
alias nv-astro="astronvim"

alias lazyvim="NVIM_APPNAME=LazyVim nvim"
alias nv-lazyvim="lazyvim"
alias nv-lazy="lazyvim"
alias lazy="lazyvim"
alias l="lazyvim"

alias vi="astronvim"
alias vim="astronvim"
# alias lv="astronvim"
alias nv="nvim"
alias n="/usr/bin/nvim"
alias v="astronvim"
alias av="astronvim"
alias an="astronvim"

## Run neofetch if session is interactive
# if status --is-interactive && type -q neofetch
#    neofetch
# end
# set -g PATH "/home/romka/.espressif/tools/xtensa-esp32-elf-clang/esp-14.0.0-20220415-x86_64-unknown-linux-gnu/bin/:$PATH"
# set -g LIBCLANG_PATH "/home/romka/.espressif/tools/xtensa-esp32-elf-clang/esp-14.0.0-20220415-x86_64-unknown-linux-gnu/lib/"
# set -g PIP_USER no

# pnpm
set -gx PNPM_HOME "/home/romka/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
set -gx GEMINI_API_KEY AIzaSyDpd8gIMHoeQHD-MesymQtPNNFUyGJguIY
# set -gx RUSTC_WRAPPER "sccache"
# pnpm end
