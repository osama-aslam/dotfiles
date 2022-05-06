# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd interactive_comments extended_history hist_expire_dups_first
zle_highlight=('paste:none') # Disable paste highlight

#History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# source functions
source $ZDOTDIR/files/functions.zsh

add_file "aliasrc.zsh"                              # aliases
add_file "iconsrc.zsh"                              # icons for lf file manager
add_file "vi-mode.zsh"                              # vi-mode and ctrl-e for editing command in vim
add_file "completions.zsh"                          # completions for zsh
add_file "cd-functions.zsh"                         # auto ls on every cd and lets you do ..3 instead of ../../..  
add_file "lfcd.zsh"                                 # cd using lf with ctrl-o
add_file ".p10k.zsh"                                # p10k prompt config
add_file "powerlevel10k/powerlevel10k.zsh-theme"    # p10k theme
add_file "command-not-found.bash"                   # bash and zsh insulter
add_file "vim-tab-completion.zsh"                   # vim keys in tab-completions

add_plugin "hlissner/zsh-autopair"                        # autopair 
add_plugin "zsh-users/zsh-autosuggestions"                # autosuggestions
add_plugin "zdharma-continuum/fast-syntax-highlighting"   # syntax highlighting

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char

eval "$(zoxide init zsh)"
