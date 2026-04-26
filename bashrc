# Daily shell helpers. Source this file from ~/.bashrc with:
# [ -f ~/seven/bashrc ] && source ~/seven/bashrc

export HISTTIMEFORMAT='%F %T '

apt-updater() {
    sudo apt-get update &&
        sudo apt-get dist-upgrade -y &&
        sudo apt-get autoremove -y &&
        sudo apt-get autoclean &&
        sudo apt-get clean
}

find_largest_files() {
    local limit="${1:-20}"
    du -h -x -s -- * 2>/dev/null | sort -r -h | head -n "$limit"
}

git_branch() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 0
    git branch --show-current 2>/dev/null
}

set_git_prompt() {
    local blu='\[\033[0;34m\]'
    local pur='\[\033[0;35m\]'
    local grn='\[\033[0;32m\]'
    local clr='\[\033[0m\]'

    PS1='${debian_chroot:+($debian_chroot)}'"${blu}"'$(
        branch="$(git_branch)"
        [ -n "$branch" ] && printf "(%s)" "$branch"
    )'"${pur}"' \W'"${grn}"' \$ '"${clr}"
}

git_init() {
    if [ -z "$1" ]; then
        printf '%s\n' 'Please provide a directory name.'
        return 1
    fi

    mkdir -p "$1" &&
        cd "$1" &&
        git init &&
        touch README.md .gitignore LICENSE &&
        printf '# %s\n' "$(basename "$PWD")" >README.md
}

sysinfo() {
    clear
    printf '\n'
    printf '   IP ADDR: %s\n' "$(curl -fsS --max-time 3 ifconfig.me 2>/dev/null || printf 'unavailable')"
    printf '   USER: %s\n' "$USER"
    printf '   DATE: %s\n' "$(date)"
    printf '   UPTIME: %s\n' "$(uptime -p 2>/dev/null || uptime)"
    printf '   HOSTNAME: %s\n' "$(hostname -f 2>/dev/null || hostname)"
    printf '   CPU: %s\n' "$(awk -F: '/model name/{gsub(/^ /, "", $2); print $2; exit}' /proc/cpuinfo 2>/dev/null || printf 'unavailable')"
    printf '   KERNEL: %s\n' "$(uname -rms)"
    printf '   PACKAGES: %s\n' "$(dpkg-query -f '.' -W 2>/dev/null | wc -c | tr -d ' ')"
    printf '   RESOLUTION: %s\n' "$(xrandr 2>/dev/null | awk '/\*/{printf $1" "; found=1} END{if (!found) printf "unavailable"}')"
    printf '   MEMORY: %s\n' "$(free -h | awk '/Mem/{print $3 "/" $2}')"
    printf '\n'
}
