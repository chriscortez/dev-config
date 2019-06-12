export EDITOR=vim

export NVM_DIR="$HOME/.nvm/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# make sure to first run `curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash`
# test -f ~/.git-completion.bash && . $_ # This loads git branch autocompletion

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=$HOME/.rbenv/bin:$PATH

# Aliases
alias etr="rm -rf ~/.Trash/*"
eval "$(rbenv init -)"

for profile_snippet in $(ls -1 ~/.bash_profile.d/*.sh)
do
    source ${profile_snippet}
done
