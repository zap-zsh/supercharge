# completions
autoload -Uz compinit

zstyle ':completion:*' menu yes select


zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
zle_highlight=('paste:none')

unsetopt BEEP
setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY
# setopt interactive_comments

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-lr-beginning-search

# Colors
autoload -Uz colors && colors

# exports
export PATH="$HOME/.local/bin":$PATH

# bindings


bindkey -M menuselect '?' history-incremental-search-forward
bindkey -M menuselect '/' history-incremental-search-backward

bindkey -s '^x' '^usource $ZDOTDIR/.zshrc\n'


compinit

# ls colors
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

