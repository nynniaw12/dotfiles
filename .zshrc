export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh


export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
source $(brew --prefix nvm)/nvm.sh
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
alias t="todo.sh"  
alias firebase="`npm config get prefix`/bin/firebase"
alias air="$HOME/go/bin/air"
alias templ="$HOME/go/bin/templ"
alias tailwindcss="$HOME/tailwindcss"

alias obs="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/aybars-main"

# tat: tmux attach
function tat {
  name=$(basename `pwd` | sed -e 's/\.//g')

  if tmux ls 2>&1 | grep "$name"; then
    tmux attach -t "$name"
  elif [ -f .envrc ]; then
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  fi
}
# rmd: view markdown
function rmd {
  pandoc $1 | lynx -stdin
}
function gomodrename {
    if [ $# -ne 2 ]; then
        echo "Usage: gomodrename <old_module_name> <new_module_name>"
        return 1
    fi

    OLD_MODULE=$1
    NEW_MODULE=$2

    go mod edit -module "$NEW_MODULE"

    find . -type f -name '*.go' \
        -exec sed -i '' -e 's/{OLD_MODULE}/{NEW_MODULE}/g' {} \;
}
bindkey -s '^f' '~/.config/scripts/tmux-sessionizer\n'

export EDITOR=nvim
export VISUAL="$EDITOR"
export PATH="$PATH:$CARGO_HOME/bin:/Applications/WezTerm.app/Contents/MacOS:$HOME/go/bin"

