# Unalias commands defined by prezto
alias d >/dev/null 2>&1 && unalias d 2>/dev/null

# Clear DNS cache
# alias dns-flush="sudo killall -HUP mDNSResponder"
# For mavericks, this is now:
alias dns-flush="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

alias als="alias | grep -i --"
alias xargs0="tr '\n' '\0' | xargs -0"

alias ack="nocorrect ack --color-lineno=yellow --color-filename=blue --color-match='black on_red'"

alias be='bundle exec'
alias vundle-install='vim +BundleInstall +qall'
alias marked='open -a marked'

alias mutt-tw='MUTT_INSTANCE=tw mutt'
alias mutt-gmail='MUTT_INSTANCE=gmail mutt'

alias go-fmt='find -L . -type f -name "*.go" -not -path "./_*" -exec goimports -w -l {} \;'
alias go-fmt-all='find -L . -type f -name "*.go" -exec goimports -w -l {} \;'

# Basic directory operations
alias pu='pushd'
alias po='popd'
alias -- -='cd +1'

# List direcory contents
alias l='ls -lAh'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

####
# Git related
####
#
# alias gs='git status -sb'
# alias ga='git add'
# alias gaa='git add -A'
alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short --branch'
alias gwm='git mv'
alias gwcx='git clean -ndx'
alias gwCx='git clean -fdx'

# Create an empty branch
alias gbC='git checkout --orphan'

# Override `gbl` and `gbL` to show upstream tracking branch name as well
# default is to alias to 'git branch -v', not showing upstream
alias gbl='git branch -vv'
alias gbL='git branch -avv'

# By default zprezto aliases gpf to 'git push --force'
# Better use --force-with-lease, see
# https://developer.atlassian.com/blog/2015/04/force-with-lease/
alias gpf='git push --force-with-lease'

# Update the ref for head on master
# e.g. gum <SHA>
alias gum='git update-ref refs/heads/master'

# Delete branch from remote origin
alias gpx='git push origin --delete'

# Git svn aliases (gv.)
alias gvr='git svn rebase'
alias gvd='git svn dcommit'
alias gvf='git svn fetch'
alias gvi='git svn info'

# Squash a branch into the current one (usually master)
alias gms='git merge --squash'

# git tag aliases (gt.)
alias gt='git tag'
alias gtl='git tag -l'
alias gtx='git tag -d'
alias gtf='git tag -f'
