export EDITOR=vim

#export NVM_DIR="$HOME/.nvm/usr/local/opt/nvm/nvm.sh"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load RVM into a shell session *as a function*
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load rbenv
#export PATH=$HOME/.rbenv/bin:$PATH
#eval "$(rbenv init -)"

for profile_snippet in $(ls -1 ~/.bash_profile.d/*.sh)
do
      source ${profile_snippet}
    done
done
