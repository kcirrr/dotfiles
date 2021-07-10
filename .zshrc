# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set custom path
export PATH="$HOME/.krew/bin:$HOME/Library/Python/3.8/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# Enable Antigen
source /usr/local/share/antigen/antigen.zsh

# Use oh-my-zsh
antigen use oh-my-zsh

# Use powerlevel10k theme
antigen theme romkatv/powerlevel10k

# Enable plugins
antigen bundle direnv
antigen bundle git
antigen bundle kubectl
antigen bundle lxd
antigen bundle extract
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Apply Antigen
antigen apply

# Set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Configure Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
# export HOMEBREW_CASK_OPTS=--require-sha

# Remove percent sign at the end of files without new line at the end
PROMPT_EOL_MARK=""

# Add paths to SSH tab completion
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/completion.d/*.list ))
zstyle ':completion:*:hosts' hosts $_ssh_config

# Load bashcompinit to allow the use of bash completions
autoload bashcompinit && bashcompinit

# Azure completion
[[ -r "/usr/local/etc/bash_completion.d/az" ]] && source "/usr/local/etc/bash_completion.d/az"

# Enable bindkeys for ZSH autosuggestions
bindkey '^ ' autosuggest-accept

# Load secrets
if [ -e ~/.secrets.zsh ]; then
  source ~/.secrets.zsh
fi

# Load aliases
if [ -e ~/.aliases.zsh ]; then
  source ~/.aliases.zsh
fi

# Load functions
if [ -e ~/.functions.zsh ]; then
  source ~/.functions.zsh
fi

# Use bat when installed
if [ "$(command -v bat)" ]; then
    unalias -m 'cat'
    alias cat='bat -pp --theme="Nord"'
fi

# Use exa when installed
if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto --icons -a -s type'
    alias ll='exa -l --color always --icons -a -s type'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
