# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="reaper"

# zsh plugins
plugins=(
  rails
  brew
  bundler
  gem
  python
  rake
  screen
  svn
  bower
  colorize
  copyfile
  copypath
  git
  git-extras
  gitignore
  ubuntu
  common-aliases
  gradle
  web-search
  wd
  tmux
  rbenv
  docker
  thefuck
  nvm
)

# ZPlug
source ~/.zplug/init.zsh
zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "romkatv/powerlevel10k", as:theme

#
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.local/bin:/usr/local/sbin:$PATH # COMMON
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH # HOMEBREW
export TERM="xterm-256color"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add cargo to PATH
export PATH="$PATH:$HOME/.cargo/bin"
if command -v pyenv > /dev/null; then
  eval "$(pyenv init -)"
  export PATH=$(pyenv root)/shims:$PATH
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export GPG_TTY=$(tty)
export EDITOR=$(which nvim)
export THOR_MERGE=$(which nvim)
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Added by `rbenv init` on Mon Aug 26 17:27:11 CEST 2024
eval "$(rbenv init - --no-rehash zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(gh copilot alias -- zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.env
