# loading zprofile
source ~/.zprofile

# alias
## common
alias reload='source ~/.zshrc'

## blog
alias cd_blog='cd ~/workplace/blog_microcms'

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

