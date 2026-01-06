# on M2 mac Ventura 13.5

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh
## sheldon zsh plugins
eval "$(sheldon source)"

## PROMPT
PROMPT='%F{green}%1c%f %# '
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
# %c: ステージングされた変更, %u: ステージングされていない変更
zstyle ':vcs_info:git:*' formats ':%F{yellow}%b%f'
# プロンプトの最後にブランチを追加
PROMPT='$ %F{cyan}%1c%f${vcs_info_msg_0_} '

# zoxide to cd
eval "$(zoxide init zsh --cmd cd)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

## java
. ~/.asdf/plugins/java/set-java-home.zsh
