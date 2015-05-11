# Dot Files

My dotfiles

### Install

Clone the repo into the home folder and link whatever is needed, for example emacs:

`ln -s ~/.dotfiles/emacs.d ~/.emacs.d`

### Emacs and Haskell

Assuming Haskell Platform (GHC/GHCi/Cabal/Cabal-Install) are installed,

    $ cabal install happy alex ghc-mod present hlint hasktags stylish-haskell hoogle


Last time I set up `Emacs` I was not able to build `structured-haskell-mode` as a git submodule repository.

So instead I did:

    $ cd ~/.emacs.d/vendor
    $ git clone https://github.com/chrisdone/structured-haskell-mode.git
    $ cd structured-haskell-mode
    $ cabal sandbox init
    $ cabal install
    $ cd elisp/
    $ make

Now `haskell-structured-mode` is built inside `.emacs.d/vendor` and `Emacs` is already configured to look at that folder.