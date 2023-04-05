# Terminal
export EDITOR=vim

## Aliases
alias etr="rm -rf ~/.Trash/*"

## make sure to first run `curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash`
test -f ~/.git-completion.bash && . $_ # This loads git branch autocompletion

## iTerm2 Shell Integration (must install in menu first)
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## iTerm2 Status Bar Options
function iterm2_print_user_vars() {
  iterm2_set_user_var phpVersion $(php -v | awk '/^PHP/ { print $2 }')
  iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
  iterm2_set_user_var nodeVersion $(node -v)
}

## Devon customization
# for profile_snippet in $(ls -1 ~/.bash_profile.d/*.sh)
# do
#     source ${profile_snippet}
# done

## Starship
eval "$(starship init bash)"

# Version management
## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

## automatically switch to the version of node defined in .nvmrc
alias cd='cdnvm(){ cd $1; if [[ -f .nvmrc && -s .nvmrc && -r .nvmrc ]]; then <.nvmrc nvm install; elif [[ $(nvm current) != $(nvm version default) ]]; then nvm use default; fi; };cdnvm'

## rbenv
# export PATH=$HOME/.rbenv/bin:$PATH
# eval "$(rbenv init -)"

## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


## PyEnv
export PATH="/Users/chris/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Android Studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_SDK=${ANDROID_HOME}

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

