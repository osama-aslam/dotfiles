
# Use neovim for vim if present.
[ -x "$(command -v lvim)" ] && alias vim="lvim" vimdiff="lvim -d"

for command in mount umount pacman su shutdown poweroff reboot ; do
        alias $command="sudo $command"
done; unset command

alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -pv" \
	ka="killall" \
	g="git" \
	p="pacman" \
	ls="exa -lm --icons --group-directories-first --color-scale" \
  lst="exa -lT --icons"\
	cls="clear" \
	x="exit" \
	lsa="exa -Ga --icons --group-directories-first" \
	cat="bat" \
	aliasrc="lvim ~/.config/zsh/files/aliasrc.zsh" \
	zshrc="lvim ~/.config/zsh/.zshrc" \
  i3rc="lvim ~/.config/i3/config" \
  ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 320k  -o '%(title)s.%(ext)s'" \
  web='lynx --accept_all_cookies https://duckduckgo.com' \
  yt="ytfzf" \
  ytt="ytfzf -t --thumb-viewer=ueberzug" \
  yttf="ytfzf -t --thumb-viewer=ueberzug -f" \
  ytf="ytfzf -f" \
  sudo='sudo ' \
  cleanup='sudo pacman -Rns $(pacman -Qtdq)' \
  lf='lfub' \
  lfrc='lvim ~/.config/lf/lfrc'
