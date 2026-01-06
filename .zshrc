# loading zprofile
source ~/.zprofile

# alias
## common
alias reload='source ~/.zshrc'
alias vscode_init='curl "https://raw.githubusercontent.com/tkc310/settings/refs/heads/main/vscode/settings.sh" | sh'

## mov to gif
alias mov2gif='(){ ffmpeg -i $1.mov -r 10 $1.gif }'

## git
alias git_clean_feature=git branch | grep feature | xargs git branch -d
alias git_clean='(){ git branch | grep $1 | xargs git branch -d }'
alias gft='git fetch'
alias gst='git status'
alias gcm='git commit'
alias gmg='git merge'
alias gbr='git branch'
alias gps='git push'
alias gpl='git pull'
alias gsync_develop='git reset --hard origin/develop'
alias gsync_main='git reset --hard origin/main'
alias gsync='git reset --hard'
alias gclean_feature='git branch | grep feature/ | xargs git branch -d'
alias gwl='git worktree list --verbose'
alias gwa='git worktree add'
alias gwr='git worktree remove'
alias gwp='git worktree prune'

## cli
alias ei="eza --icons --git"
alias ea="eza -la --icons --git"
alias ee="eza -aahl --icons --git"
alias et="eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
alias ls=ei
alias la=ea
alias ll=ee

### with mkdir -p
function mtouch {
    mkdir -p "$(dirname "$1")" && touch "$1"
}
function mvi {
    mkdir -p "$(dirname "$1")" && vi "$1"
}

### ghq + fzf
cdrepo() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}
coderepo() {
  local repodir=$(ghq list | fzf -1 +m) &&
  echo Open Cursor WorkSpace! : $(ghq root)/$repodir
  if [ -n "$repodir" ]; then
   cursor $(ghq root)/$repodir
  fi
}

## mise
alias misela='mise ls-remote' # mise ls-remote node
alias misei='mise install' # mise install node@xxx
alias miseu='mise use' # mise use node@xxx
alias miseg='mise global' # mise global node@xxx
