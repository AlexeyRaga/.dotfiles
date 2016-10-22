export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/.rvm/bin"
export PATH=${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="${HOME}/.cabal/bin:${PATH}"
export PATH=$PATH:/opt/local/bin

# export GOROOT=$HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

export NVM_DIR="/Users/alexey/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e ${HOME}/.nix-profile/etc/profile.d/nix.sh && . ${HOME}/.nix-profile/etc/profile.d/nix.sh

ssh-add ~/.ssh/id_rsa

