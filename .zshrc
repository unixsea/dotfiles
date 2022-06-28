autoload -U colors && colors	# Load colors
export TERM="xterm-256color"                      # getting proper colors

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

alias updatepkgs='sudo pacman -Syyu'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias df='df -h'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias vim='vim'
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias nf='neofetch'
alias morbin="sudo pacman -S"

HISTFILE=~/.history-zsh
HISTSIZE=10000
SAVEHIST=10000
setopt append_history           # allow multiple sessions to append to one history
setopt bang_hist                # treat ! special during command expansion
setopt extended_history         # Write history in :start:elasped;command format
setopt hist_expire_dups_first   # expire duplicates first when trimming history
setopt hist_find_no_dups        # When searching history, don't repeat
setopt hist_ignore_dups         # ignore duplicate entries of previous events
setopt hist_ignore_space        # prefix command with a space to skip it's recording
setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
setopt hist_verify              # Don't execute immediately upon history expansion
setopt inc_append_history       # Write to history file immediately, not when shell quits
setopt share_history            # Share history among all sessions

eval "$(starship init zsh)"
export PATH=$PATH:/home/unix/.spicetify
