# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
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
  rvm
  screen
  svn
  bower
  colorize
  copyfile
  copydir
  git
  git-extras
  gitignore
  ubuntu
  common-aliases
  gradle
  web-search
  wd
  zsh-syntax-highlighting
  zsh-completions
  k
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH
export PATH=/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.local/bin:$PATH #COMMON
export TERM="xterm-256color"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
[ ! -s /Users/reaper/.travis/travis.sh ] || source /Users/reaper/.travis/travis.sh
export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add cargo to PATH
export PATH="$PATH:$HOME/.cargo/bin"

# LIBPQ
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
