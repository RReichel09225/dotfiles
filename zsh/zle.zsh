# keybindings and other goodness

# alt+s to prepend 'sudo ' to current command and move to EOL
bindkey -s '\es' '^Asudo ^E'

# alt+d to show current working directory
bindkey -s '\ed' '^Upwd^M'

# alt+u to move to parent directory and list it
bindkey -s '\eu' '^Ucd ..; ls^M'

# alt+U to move to parent directory
bindkey -s '\eU' '^Ucd ..^M'

# If AUTO_PUSHD is set, alt+p pops the dir stack
bindkey -s '\ep' '^Upopd >/dev/null; dirs -v^M'

# alt+P shows the dir stack
bindkey -s '\eP' '^Udirs -v^M'

# alt+l: execute 'ls'
bindkey -s '\el' '^Uls^M'

# alt+L: execute 'ls -lhA'
bindkey -s '\eL' '^Uls -lhA^M'

# alt+v: pipe current command to view
bindkey -s '\ev' '^E 2>&1 | view -^M'

# alt+g: execute 'git status'
bindkey -s '\eg' '^Ugws^M'

# alt+G: execute 'git status .'
bindkey -s '\eG' '^Ugws .^M'

# control+j: add new-line for multi-line edits in zle (needs exception for midnight commander)
if [[ "$MC_SID" != "" || "$MC_CONTROL_PID" != "" ]]; then
    bindkey "^J" accept-line
else
    bindkey "^J" self-insert
fi

# alt+.: insert last argument of previous command
bindkey '\e.' insert-last-word

# menu selection: pick item but stay in the menu
# bindkey -N menuselect  # keymap 'menuselect' must be created aforehand
# bindkey -M menuselect '\e^M' accept-and-menu-complete

# Store current line onto the stack, execute another command and pop it
# on the next prompt (can be single line during multiline command)
bindkey '\eq' push-line

# Store entire current buffer onto the stack, execute another command and
# pop it on the next prompt
bindkey '\eQ' push-input


### Selecta sweetness

# cd into a folder
function _selecta-cd-find {
    zle kill-buffer
    BUFFER="cd $(find . -type d 2>/dev/null | egrep -v '^.$|/.svn|/.git' | selecta)"
    zle accept-line
}
zle -N _selecta-cd-find
bindkey '\eD' _selecta-cd-find

# edit a file
# (uses `ag` which is very fast and ignores .svn, .git, etc by default)
function _selecta-edit-find {
    zle kill-buffer
    BUFFER="${=${VISUAL:-${EDITOR:-nano}}} $(ag --nogroup --nocolor -l . 2>/dev/null | selecta)"
    zle accept-line
}
zle -N _selecta-edit-find
bindkey '\eE' _selecta-edit-find

# recall history
function _selecta-history-find {
    zle kill-buffer
    zle -U "$(history -rn 1 | selecta)"
    zle redisplay
}
zle -N _selecta-history-find
bindkey '\eH' _selecta-history-find

# insert a file or directory at current cursor position in the buffer
function _selecta-file-dir {
    trap '' INT
    zle -U "$(find . 2>/dev/null \
        | egrep -v '^.$|/.svn|/.git' \
        | selecta)"
    zle redisplay
    trap - INT
}
zle -N _selecta-file-dir
bindkey '^t' _selecta-file-dir

# insert the relative path to the root of the current git repo
# (prints nothing if not inside a git repo)
function _git-root-relative {
    zle -U "$(git rev-parse --show-cdup 2>/dev/null)"
}
zle -N _git-root-relative
bindkey "\er" _git-root-relative

# insert the absolute path to the root of the current git repo
# (prints nothing if not inside a git repo)
function _git-root-absolute {
    zle -U "$(git rev-parse --show-toplevel 2>/dev/null)"
}
zle -N _git-root-absolute
bindkey "\eR" _git-root-absolute

# Navigate word forward/backward with alt+left/right
# bindkey '^[[1;9C' forward-word
bindkey '\e\e[C' forward-word
# bindkey '^[[1;9D' backward-word
bindkey '\e\e[D' backward-word
