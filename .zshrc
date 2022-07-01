autoload -U compinit
compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git cp colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# History #####################################################################

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.


# BEGIN aliases ###############################################################

alias amend="git commit --amend --no-edit"

alias cpwd="pwd | tr -d '\n' | xclip -in -selection clipboard && echo 'pwd copied to clipboard'"
alias bajanda="shutdown +0"
alias cls="clear"
alias flt="flutter"
alias flt1="$HOME/dev/flutter1/bin/flutter"
alias flt2="$HOME/dev/flutter2/bin/flutter"
alias subl="flatpak run com.sublimetext.three"
alias yarn="/usr/local/lib/node_modules/yarn/bin/yarn"

# END aliases #################################################################



# BEGIN custom paths ##########################################################

# Custom folder on path for scripts, binaries etc
export PATH="$PATH:$HOME/dev/onPath"

# Flutter
export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:$HOME/dev/flutter/bin/cache/dart-sdk/bin/"
export PATH="$PATH:$HOME/dev/flutter/.pub-cache/bin/"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Android related
export ANDROID_HOME="$HOME/dev/androidSDK"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME"

# Go
export GOROOT="$HOME/dev/go"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME/dev/go-package-cache"

# Rust
# export PATH="$HOME/.cargo/bin:$PATH"

# Scala
# export SCALA_HOME="$HOME/dev/sbt"
# export PATH="$PATH:$SCALA_HOME/bin"

#Python
# Add python packages executables to path
export PATH="$PATH:$HOME/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Browser

export CHROME_EXECUTABLE="/usr/bin/microsoft-edge"

# END custom paths ############################################################



# BEGIN functions #############################################################

# Create a directory and enter it

function mkcd {
  command mkdir $1 && cd $1
}

# Git shallow clone https://host.com/user/repo.git --depth=1

function gsc {
  repo=$1
  echo repo
  git clone $repo --depth=1
}

# END functions ###############################################################



###############################################################################
# MACOS SPECIFIC CONFIG
###############################################################################

if [[ $OSTYPE == darwin* ]]; then

  # Apple watch & fingerprint sudo auth
  sudo() {
      unset -f sudo
      if ! grep --silent "pam_tid.so" /etc/pam.d/sudo ; then
        sudo sed -i.orig "1s/^/auth       sufficient     pam_tid.so\n/" /etc/pam.d/sudo
      fi
      sudo "$@"
  } 
  
fi 

###############################################################################
# END MACOS CONFIG
###############################################################################



eval "$(starship init zsh)"
