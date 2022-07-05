
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd extended_history share_history hist_expire_dups_first
zle_highlight=('paste:none') # Disable paste highlight

[ -f "$ZDOTDIR/functions.zsh" ] && source "$ZDOTDIR/functions.zsh"

files=(
  .p10k                     # p10k config file
  hist                      # history
  completions               # tab completions
  aliasrc                   # aliases
  cd-functions              # functions for "cd"
  iconsrc                   # icons for lf
  # command-not-found         # insulter
  # vi-mode                   # vi-mode etc.
)

plugins=(
  romkatv/powerlevel10k                         # prompt
  romkatv/zsh-defer                             # zsh-defer
  zsh-users/zsh-autosuggestions                 # autosuggestions
  zdharma-continuum/history-search-multi-word   # history (Ctrl+R)
  agkozak/zsh-z                                 # autojump 
  zdharma-continuum/fast-syntax-highlighting    # syntax-highlighting
)

file-load $files
plugin-load $plugins
