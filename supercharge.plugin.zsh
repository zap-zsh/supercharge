autoload -Uz plug

# completions
autoload -Uz compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
zle_highlight=('paste:none')
for dump in "${ZDOTDIR:-$HOME}/.zcompdump"(N.mh+24); do
  compinit
done
compinit -C

unsetopt BEEP
setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# exports
export PATH="$HOME/.local/bin:$PATH"

# bindings
bindkey -s '^x' '^usource $ZSHRC\n'
bindkey -M menuselect '?' history-incremental-search-forward
bindkey -M menuselect '/' history-incremental-search-backward
bindkey '^H' backward-kill-word # Ctrl + Backspace to delete a whole word.

# compinit

# ls colors

# define the color scheme for ls command

export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'

# * ow=36 : The color for "other writable" files is set to blue (color code 36).
# * di=34 : The color for directories is set to blue (color code 34).
# * fi=32 : The color for regular files is set to green (color code 32).
# * ex=31 : The color for executable files is set to red (color code 31).
# * ln=35 : The color for symbolic links is set to magenta (color code 35).

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

# Less pager color scheme (Useful for man pages using `less`)
# These settings enhance the readability and visual distinction of different text elements when viewing files with the less command in the terminal.

# LESS_TERMCAP_md: Set format for bold text (standout mode). The value '\e[32m' means that bold text will be displayed in green (ANSI color code 32).
export LESS_TERMCAP_md=$'\e[32m'

# LESS_TERMCAP_me: This resets any text attributes (like bold or underline) back to normal. The value '\e[0m' means reset all attributes.
export LESS_TERMCAP_me=$'\e[0m'

# LESS_TERMCAP_se: This ends standout mode. The value '\e[0m' means reset all attributes.
export LESS_TERMCAP_se=$'\e[0m'

# LESS_TERMCAP_so: This sets the format for standout mode, which is often used for highlighted text. The value '\e[100;37m' means a background color of gray (100) and a foreground color of white (37).
export LESS_TERMCAP_so=$'\e[100;37m'

# LESS_TERMCAP_ue: This ends underline mode. The value '\e[0m' means reset all attributes.
export LESS_TERMCAP_ue=$'\e[0m'

# LESS_TERMCAP_us: This sets the format for underlined text. The value '\e[34m' means underlined text will be displayed in blue (ANSI color code 34).
export LESS_TERMCAP_us=$'\e[34m'

# GROFF_NO_SGR: This disables the use of SGR (Select Graphic Rendition) escape sequences for groff, which is a typesetting system. Setting this to 1 means using traditional (non-SGR) escape sequences for formatting, ensuring compatibility with certain terminals that might not handle SGR codes correctly.
export GROFF_NO_SGR=1
