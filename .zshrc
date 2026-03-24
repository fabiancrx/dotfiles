###############################################################################
# Oh my ZSH init
###############################################################################

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Smarter completion initialization
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi
 
###############################################################################
# END OMZ
###############################################################################

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
alias flt="fvm flutter"
alias fl="fvm flutter"
alias flutter="fvm flutter"
 
 
case "$OSTYPE" in
   linux*)
      alias start="xdg-open"
      alias open="xdg-open"
      ;;
   darwin*)
      alias start="open"
      ;;
esac
 
# END aliases #################################################################
 
 
 
# BEGIN custom paths ##########################################################

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="$HOME/AndroidStudioProjects/bin:$PATH"
 
## Android

export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
 

# flutter config --jdk-dir "$JAVA_HOME"
export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/ms-17.0.16/Contents/Home
export GRADLE_LOCAL_JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/ms-17.0.16/Contents/Home

## Flutter and Dart
export PATH="$PATH:$HOME/fvm/versions/stable/bin/cache/dart-sdk/bin/" # Dart sdk from latest stable flutter release
export PATH="$PATH:$HOME/.pub-cache/bin"  # Global packages
export PATH="$PATH:$HOME/fvm/default/bin" # Flutter SDK
 
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
sudo sed -i.orig "1s/^/auth sufficient pam_tid.so\n/" /etc/pam.d/sudo
      fi
      sudo "$@"
  }
  
fi
 
###############################################################################
# END MACOS CONFIG
###############################################################################

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Oh my ZSH configuration

## Speed up initial load time
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

ZSH_THEME="spaceship"

# Spaceship settings (fixed syntax)
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="⚡"

# Minimal spaceship sections for performance
SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  git
  line_sep
  char
)



## Install plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting  # Always last!
)




source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='subl'
else
  export EDITOR='subl'
fi
