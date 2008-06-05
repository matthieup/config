# .zshrc
# (c) 2001 by Robert Manea <rob dot manea at gmail dot com>
#

# ---[ System settings ]------------------------------------------------
limit -s coredumpsize 0
umask 0027

# ---[ ZSH Options ]----------------------------------------------------
# General
setopt   ALWAYS_TO_END BASH_AUTO_LIST NO_BEEP CLOBBER
setopt   AUTO_CD CD_ABLE_VARS MULTIOS CORRECT_ALL

# Job Control
setopt   CHECK_JOBS NO_HUP

# History
setopt   INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_FIND_NO_DUPS
setopt	 EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST
setopt   HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
DIRSTACKSIZE=20

# Stay compatible to sh and IFS
setopt	 SH_WORD_SPLIT

setopt   notify globdots pushdtohome
setopt   recexact longlistjobs
setopt   autoresume pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt BG_NICE HUP autoparamslash

# Prompt
. ~/.zshprompt
setprompt

# Don't expand files matching:
fignore=(.o .c~ .old .pro)

# ---[ Environment ]---------------------------------------------------
export EDITOR=vi
# Unicode Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PS_PERSONALITY='linux'

# Manpath & Manualpage search order
export MANSECT=3:2:9:8:1:5:4:7:6:n
export PATH=$PATH:/usr/local/bin

# Syntax highlight for less with 'source-highlite'
PAGER='less -X -M'
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# ---[ Alias Section ]-------------------------------------------------
eval `dircolors`
alias c='clear'
alias l='ls -CF'
alias cd..='cd ..'
alias ...='cd ../..'
alias ssh='ssh -2'
alias xpdf='xpdf'
alias pa='ps aux'
alias vi='vim -c ":cd %:p:h"'
alias mc='mc -bs'
alias man='PAGER=less man'
alias cdc='cd ~; clear'
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias ff='firefox3'
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias top=htop
alias grep=egrep
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -a --color=auto'
# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'
# List only file beginning with "."
alias lsa='ls -ld .*'
# web cat
alias wcat='wget -q -O -'
alias dog=wcat

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g L='less'
alias -g M='more'
alias -g H='head'
alias -g T='tail'

# ---[ Key bindings ]--------------------------------------------------
bindkey -e
bindkey "^[[3~" delete-char
bindkey '\eq' push-line-or-edit
bindkey '^p' history-search-backward
bindkey "^[[3A"  history-beginning-search-backward
bindkey "^[[3B"  history-beginning-search-forward
bindkey -s '^B' " &\n"

# ---[ Shell functions ]-----------------------------------------------
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
# Simple commandline calculator
function calc () {
    awk "BEGIN { print $@ }"
}

# ---[ Terminal settings ]---------------------------------------------
case "$TERM" in
	linux)
		bindkey '\e[1~' beginning-of-line	# Home
		bindkey '\e[4~' end-of-line		# End
		bindkey '\e[3~' delete-char		# Del
		bindkey '\e[2~' overwrite-mode		# Insert
		;;
	screen)
		# In Linux console
		bindkey '\e[1~' beginning-of-line	# Home
		bindkey '\e[4~' end-of-line		# End
		bindkey '\e[3~' delete-char		# Del
		bindkey '\e[2~' overwrite-mode		# Insert
		bindkey '\e[7~' beginning-of-line	# home
		bindkey '\e[8~' end-of-line		# end
		# In rxvt
		bindkey '\eOc' forward-word		# ctrl cursor right
		bindkey '\eOd' backward-word		# ctrl cursor left
		bindkey '\e[3~' backward-delete-char	# This should not be necessary!
		;;
	rxvt*)
		bindkey '\e[7~' beginning-of-line	# home
		bindkey '\e[8~' end-of-line		# end
		bindkey '\eOc' forward-word		# ctrl cursor right
		bindkey '\eOd' backward-word		# ctrl cursor left
		bindkey '\e[3~' backward-delete-char	# This should not be necessary!
		bindkey '\e[2~' overwrite-mode		# Insert
		;;
	xterm*)
		bindkey "\e[1~" beginning-of-line	# Home
		bindkey "\e[4~" end-of-line		# End
		bindkey '\e[3~' delete-char		# Del
		bindkey '\e[2~' overwrite-mode		# Insert
		;;
	sun)
		bindkey '\e[214z' beginning-of-line       # Home
		bindkey '\e[220z' end-of-line             # End
		bindkey '^J'      delete-char             # Del
		bindkey '^H'      backward-delete-char    # Backspace
		bindkey '\e[247z' overwrite-mode          # Insert
		;;
esac


# ---[ Completition system ]-------------------------------------------
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%d:'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=3 yes
zstyle ':completion:*' prompt 'Alternatives %e:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/robert/.zshrc'

# ---[ Modules ]-------------------------------------------------------
zmodload zsh/complist
autoload -Uz compinit
compinit
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -ap zsh/mapfile mapfile

