[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

alias \
  cp="cp -iv" \
  mv="mv -iv" \
  rm="rm -vI" \
  mkd="mkdir -pv" \
  x="exit" \
  lf="lfub" \
  fetch="neofetch" \
  neofetch="neofetch --kitty --source $HOME/.config/neofetch/neofetch.png --size 210px" \
  ls="exa -lm --icons --group-directories-first --color-scale" \
  lsa="exa -Ga --icons --group-directories-first" \
  lst="exa -lT --icons" \
  cat="bat" \
  catp="bat -pp" \
  i3rc="vim ~/.config/i3/config" \
  aliasrc="vim ~/.config/zsh/aliasrc.zsh" \
  zshrc="vim ~/.config/zsh/.zshrc" \
  cleanup="sudo pacman -Rns $(pacman -Qtdq)"
