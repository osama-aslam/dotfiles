# do ..3 instead of cd ../../../

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

