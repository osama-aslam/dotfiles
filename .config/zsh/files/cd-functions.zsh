#Smart cd

cd () {
  if [[ -f ${1} ]]
  then
    [[ ! -e ${1:h} ]] && return 1
    print "Correcting ${1} to ${1:h}"
    builtin cd ${1:h}
  else
    builtin cd ${1}
  fi
}

# do .. 3 instead of cd ../../../

..() {
  local dir
  local i
  local levels="${1:-1}"

  for ((i = 0;  i< levels; i++)); do
    dir+="../"
  done

  cd "$dir"
}

# auto ls on every cd

function chpwd() {
  emulate -L zsh
  exa -Ga --icons --group-directories-first
}

# Use lf to switch directories and bind it to ctrl-o

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' 'lfcd\n' # cd with lf (ctrl + o) 
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'  # cd with fzf (ctrl+f)
