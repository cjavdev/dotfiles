alias ls='ls -G'
alias vi="nvim"
alias iv="nvim"
alias gs="git status"
alias gd="git diff"
alias $=''

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

export EDITOR=nvim
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Git branch and status in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

parse_git_status() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

setopt PROMPT_SUBST
export PROMPT='%~ $(parse_git_branch)$(parse_git_status) $ '


. /opt/homebrew/opt/asdf/libexec/asdf.sh

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.zsh/completion/git-completion.bash
