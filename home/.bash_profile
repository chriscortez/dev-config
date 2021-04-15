export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# make sure to first run `curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash`
test -f ~/.git-completion.bash && . $_ # This loads git branch autocompletion

# Android Studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_SDK=${ANDROID_HOME}

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"


# Aliases
alias etr="rm -rf ~/.Trash/*"

# Blueprint ALiases
alias bp-clinic="cd ~/Workspace/blueprint/web/clinician_app"
alias bp-hellojoy="cd ~/Workspace/blueprint/web/hellojoy"
alias bp-insights="cd ~/Workspace/blueprint/joy_insights"
alias bp-ios="cd ~/Workspace/blueprint/joy_ios"
alias bp-notif="cd ~/Workspace/blueprint/blueprint_notifications"
alias bp-patient="cd ~/Workspace/blueprint/web/patient_app"
alias bp-rn="cd ~/Workspace/blueprint/blueprint_rn"

# Devon customization
# for profile_snippet in $(ls -1 ~/.bash_profile.d/*.sh)
# do
#     source ${profile_snippet}
# done

# iTerm2 Shell Integration (must install in menu first)
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# iTerm2 Status Bar Options
function iterm2_print_user_vars() {
  iterm2_set_user_var phpVersion $(php -v | awk '/^PHP/ { print $2 }')
  iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
  iterm2_set_user_var nodeVersion $(node -v)
}

# automatically switch to the version of node defined in .nvmrc
alias cd='cdnvm(){ cd $1; if [[ -f .nvmrc && -s .nvmrc && -r .nvmrc ]]; then <.nvmrc nvm install; elif [[ $(nvm current) != $(nvm version default) ]]; then nvm use default; fi; };cdnvm'

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# Starship
eval "$(starship init bash)"

#PyEnv
export PATH="/Users/chris/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
