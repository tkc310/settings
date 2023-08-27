# on M2 mac Ventura 13.5

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh
## Powerlevel10k
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

## zsh-completions, zsh-autosuggestions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

## java
. ~/.asdf/plugins/java/set-java-home.zsh
