#####################################################################
# environment
#####################################################################
# Better umask
umask 022

# overwrite wordchars from default oh-my-zsh setting
# WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

#####################################################################
# COMPLETION
#####################################################################

#####################################################################
# PROMPT
#####################################################################

# overwrite oh-my-zsh default git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='%{$fg[cyan]%}%B%n@%m %{$fg[blue]%}$(git_prompt_info)$(svn_prompt_info)%{$fg[blue]%}%b%{$reset_color%}%# '
RPROMPT='%{$fg[yellow]%}[%35<..<%~]%{$reset_color%}'

if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] ; then
        PROMPT='%{$fg[white]%}${HOST%%.*} ${PROMPT}%{$reset_color%}'
fi

if [ $UID = "0" ]; then
    PROMPT='%B%{$fg[red]%}%/#%{$reset_color%}%b '
    PROMPT2='%B%{$fg[red]%}%_#%{$reset_color%}%b '
fi

# Multi line prompt
PROMPT2='%_%% '
# Spell miss prompt
SPROMPT='correct> %R -> %r [n,y,a,e]? '


#####################################################################
# options
######################################################################
#{{{
setopt auto_resume
# Ignore <C-d> logout
#setopt ignore_eof
# Disable beeps
setopt no_beep
# {a-c} -> a b c
setopt brace_ccl
# Enable spellcheck
setopt correct
# Enable "=command" feature
setopt equals
# Disable flow control
setopt no_flow_control
# Ignore dups
setopt hist_ignore_dups
# Reduce spaces
setopt hist_reduce_blanks
# Ignore add history if space
setopt hist_ignore_space
# Save time stamp
setopt extended_history
# Expand history
setopt hist_expand
# Better jobs
setopt long_list_jobs
# Enable completion in "--option=arg"
setopt magic_equal_subst
# Add "/" if completes directory
setopt mark_dirs
# Disable menu complete for vimshell
setopt no_menu_complete
setopt list_rows_first
# Expand globs when completion
setopt glob_complete
# Enable multi io redirection
setopt multios
# Can search subdirectory in $PATH
setopt path_dirs
# For multi byte
setopt print_eightbit
# Print exit value if return code is non-zero
setopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_silent
# Short statements in for, repeat, select, if, function
setopt short_loops
# Ignore history (fc -l) command in history
setopt hist_no_store
setopt transient_rprompt
unsetopt promptcr
setopt hash_cmds
setopt numeric_glob_sort
# Enable comment string
setopt interactive_comments
# Improve rm *
setopt rm_star_wait
# Enable extended glob
setopt extended_glob
# Note: It is a lot of errors in script
# setopt no_unset
# Prompt substitution
setopt prompt_subst
if [[ ${VIMSHELL_TERM:-""} != "" ]]; then
        setopt no_always_last_prompt
else
        setopt always_last_prompt
fi
# List completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
# Check original command in alias completion
setopt complete_aliases
# }}}

#####################################################################
# alias
######################################################################
# Global aliases {{{
alias -g A="| awk"
alias -g G="| grep"
alias -g GV="| grep -v"
alias -g H="| head"
alias -g L="| $PAGER"
alias -g P=" --help | less"
alias -g R="| ruby -e"
alias -g S="| sed"
alias -g T="| tail"
alias -g V="| vim -R -"
alias -g U=" --help | head"
alias -g W="| wc"
alias -g F="find . -type f"
alias -g FG="find . -type f|xargs grep "
# }}}

# Suffix aliases {{{
alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s gz=gzcat
alias -s tbz=bzcat
alias -s bz2=bzcat
alias -s java=vim
alias -s c=vim
alias -s h=vim
alias -s C=vim
alias -s cpp=vim
alias -s txt=vim
alias -s xml=vim
alias -s html=opera
alias -s xhtml=opera
alias -s gif=display
alias -s jpg=display
alias -s jpeg=display
alias -s png=display
alias -s bmp=display
alias -s mp3=amarok
alias -s m4a=amarok
alias -s ogg=amarok
# }}}

# Improve lv
alias lv="lv -c -T8192"

# Better mv, cp, mkdir
alias mv="nocorrect mv"
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"

# emacs no window
alias emacsnw="env TERM=xterm-256color emacs -nw"

# Automatic exec emacs
alias emacsclient="emacsclient -a emacs"

# Use rlwrap commands
if [ -x "/usr/bin/rlwrap" -o  -x "/usr/local/bin/rlwrap" ]; then
        alias irb="rlwrap irb"
        alias ghci="rlwrap ghci"
        alias clisp="rlwrap -b '(){}[],#\";| ' clisp"
        alias gcl="rlwrap -b '(){}[],#\";| ' gcl"
        alias gosh="rlwrap -b '(){}[],#\";| ' gosh"
fi

# Move to previous directory
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

# development
alias py="python"
alias rb="ruby"
alias gdb="gdb -silent"
alias gpp="g++"

# Improve du, df
alias du="du -h"
alias df="df -h"

# Improve od for hexdump
alias od="od -Ax -tx1z"
alias hexdump="hexdump -C"
alias hexd=hexdump

# Better where
alias where="command -v"

# Better jobs
alias j="jobs -l"

alias scrr="screen -U -D -RR"

#####################################################################
# keybinds
######################################################################


#####################################################################
# functions
######################################################################

# Set environment variables easily
setenv () { export $1="$@[2,-1]" }

#-------------------------------------------------------
# Print all histories
function history-all { history -E 1 }

#-------------------------------------------------------
# File encode conversion
function euc() {
for i in $@; do;
        nkf -e -Lu $i >! /tmp/euc.$$ # -Lu : New line is LF
        mv -f /tmp/euc.$$ $i
done;
}
function sjis() {
for i in $@; do;
        nkf -s -Lw $i >! /tmp/euc.$$ # -Lw : New line is CRLF
        mv -f /tmp/euc.$$ $i
done;
}

#####################################################################
# others
######################################################################

