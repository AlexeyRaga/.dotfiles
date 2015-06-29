# export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/Library/Haskell/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

