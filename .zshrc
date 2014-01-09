HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
DIRSTACKSIZE=50
cdpath=(.)

setopt extended_glob
export EDITOR="vim"
set -o emacs

# aliases
if [[ -r ${HOME}/.aliasrc ]]; then
  echo loading aliases
  eval `awk '/^[^# ]/ {print "alias " $0}' ${HOME}/.aliasrc`
fi

# sudo cd === bossmode
function sudo() {
  if [[ "$1" == "cd" ]]; then
    shift
    mkdir -p "$@"
    cd "$@"
  else
    /usr/bin/sudo "$@"
  fi
}

