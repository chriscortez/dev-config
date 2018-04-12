# Ensure git is in the path
# (and try to find it if it is not)
GIT=git
command -v ${GIT} >/dev/null 2>&1

if [ "$?" != "0" ]
then
  # No git in the path... check some other places

  # Tests if there is a git binary at the given location
  git_check () {
    ${1}/git --version >/dev/null 2>&1
    return $?
  }

  # Locations to check
  location_1=/usr/local/bin
  location_2=/usr/local/sbin
  location_3=/usr/local/git/bin
  location_4=/opt/git/bin

  if git_check ${location_1}
  then
    GIT=${location_1}/git
  elif git_check ${location_2}
  then
    GIT=${location_2}/git
  elif git_check ${location_3}
  then
    GIT=${location_3}/git
  elif git_check ${location_4}
  then
    GIT=${location_4}/git
  elsif
    GIT=
  fi
fi

function __prompt_command() {
  EXIT="$?"
  # ^^ This needs to be first (capture last command return code)

  # ANSI color codes
  LIGHT_BLUE='\[\e[1;34m\]'
  LIGHT_GREEN='\[\e[1;32m\]'
  LIGHT_PURPLE='\[\e[1;35m\]'
  LIGHT_RED='\[\e[1;31m\]'
  YELLOW='\[\e[1;33m\]'

  CLEAR_COLOR='\[\e[0m\]'

  # Start the prompt with a newline
  # (add a bit of separation from the previous command's output)
  PS1="\n"

  # Set the user/host color and prompt character
  # based on if the user is root or not
  if [ $EUID -ne 0 ]
  then
    # Use green for the host, and include the username
    PS1+="${LIGHT_GREEN}\u@"
    # Non-root shells get a $ prompt
    PROMPT_CHAR='$'
  else
    # Use red for the host, and don't bother including the username
    PS1+="${LIGHT_RED}"
    # Root shells get a # prompt
    PROMPT_CHAR='#'
  fi

  # Add the host, timestamp, and the full path to the current working directory
  # (for current dir name only, use \W instead)
  PS1+="\h ${LIGHT_PURPLE}\t ${LIGHT_BLUE}\w "

  if [ "${GIT}x" != "x" ]
  then
    # Attempt to get the current git branch
    # If we are in a git repo, this will succeed and the return
    # code will be 0 (so add the branch name to the prompt)
    GIT_BRANCH=$(${GIT} rev-parse --abbrev-ref HEAD 2>/dev/null)
    GIT_RC=$?
    if [ "${GIT_RC}" == 0 ]
    then
      PS1+="("

      # Make the default branch name green
      # If we are on the development branch, it should be yellow
      # If the branch is master or production, make it red
      case ${GIT_BRANCH} in
        develop | development)
          BRANCH_COLOR=${YELLOW}
          ;;
        master | production)
          BRANCH_COLOR=${LIGHT_RED}
          ;;
        *)
          BRANCH_COLOR=${LIGHT_GREEN}
      ;;
      esac

      # Check the working copy status for staged and unstaged changes
      ${GIT} diff --no-ext-diff --quiet --exit-code
      staged_changes=$?
      ${GIT} diff-index --cached --quiet HEAD --
      unstaged_changes=$?

      add_ins=''
      if [ "${staged_changes}" != "0" ]
      then
        add_ins='*'
      fi
      if [ "${unstaged_changes}" != "0" ]
      then
        add_ins+='+'
      fi

      if [ "${add_ins}x" != "x" ]
      then
        add_ins=" ${add_ins}"
      fi
      PS1+="${BRANCH_COLOR}${GIT_BRANCH}${add_ins}${LIGHT_BLUE}) "
    fi
  fi

  # If the last command run before this prompt was generated returned a
  # non-zero return code, it most likely failed in some way... make the
  # prompt char red to point that out
  if [[ $EXIT -ne 0 ]]
  then
    PS1+="${LIGHT_RED}"
  fi

  # Put the prompt char followed by a space on a new line
  # (so even if our working dir path takes up a lot of space, we still have a
  # full line to enter new commands on)
  PS1+="\n${PROMPT_CHAR}${CLEAR_COLOR} "
}

PROMPT_COMMAND=__prompt_command
export PROMPT_COMMAND
