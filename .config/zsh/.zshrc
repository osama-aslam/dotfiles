
setopt autocd extended_history share_history hist_expire_dups_first
zle_highlight=('paste:none') # Disable paste highlight

[ -f "$ZDOTDIR/plugins/zsh-defer/zsh-defer.plugin.zsh" ] && source "$ZDOTDIR/plugins/zsh-defer/zsh-defer.plugin.zsh"
[ -f "$ZDOTDIR/files/functions.zsh" ] && source "$ZDOTDIR/files/functions.zsh"

files=(
  prompt                    # prompt
  hist                      # history
  completions               # tab completions
  aliasrc                   # aliases
  cd-functions              # functions for "cd"
  vi-mode                   # vi-mode etc.
  iconsrc                   # icons for lf
  # command-not-found         # insulter
)

plugins=(
  zsh-users/zsh-autosuggestions                 # autosuggestions
  zdharma-continuum/history-search-multi-word   # history (Ctrl+R)
  agkozak/zsh-z                                 # autojump 
  zdharma-continuum/fast-syntax-highlighting    # syntax-highlighting
)

file-load $files
plugin-load $plugins
