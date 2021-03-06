# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="pygmalion"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gitignore git-prompt git-extras pyenv python gnu-utils rsync virtualenv history-substring-search golang pip pass pylint man cargo rust extract rbenv) 

source $ZSH/oh-my-zsh.sh
export LOCALE_ARCHIVE_2_11="$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)/lib/locale/locale-archive"
export LOCALE_ARCHIVE_2_27="$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)/lib/locale/locale-archive"
export LOCALE_ARCHIVE="/usr/bin/locale"
source /home/ANT.AMAZON.COM/fraber/.nix-profile/etc/profile.d/nix.sh

# Disable auto update
export DISABLE_AUTO_UPDATE="true"

# Customize to your needs...
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*:*:vi(m|):*' ignored-patterns '*.o|*.pyc|*.test|*.lo' 
zstyle ':completion:*:*:git:*' ignored-patterns '*.o' 
autoload -Uz compinit

# caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# remove slash if argument is a directory
zstyle ':completion:*' squeeze-slashes true

function calc
{
    echo "$*"|bc -l;
}


fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

set COMPLETE_ALIASES
. ~/.zsh_aliases
compdef sshrc=ssh
autoload -U compinit && compinit -i
autoload -U bashcompinit && bashcompinit

# Rust
source $HOME/.cargo/env

# rbenv
export RBENV_ROOT=$HOME/.rbenv

export PYENV_ROOT=$HOME/.pyenv

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


export TERM=xterm-256color
export MANPAGER="/usr/bin/most -s"
export VISUAL=nvim
export EDITOR=nvim
export GOPATH="/home/ANT.AMAZON.COM/fraber/go"

export PATH=/opt/darktable/bin:$HOME/.toolbox/bin:$HOME/bin:$GOPATH/bin:/usr/local/go/bin:$HOME/.runtimes/NodeJS/15.x/bin:$HOME/.rbenv/bin:$HOME/.lua-language-server/bin:$HOME/.aarch64-linyx-musl-cross/bin:$PATH
EDA_AUTO=$(mktemp -d)
eda completions zsh > $EDA_AUTO/_eda
fpath=($EDA_AUTO $fpath)
source <(gopass completion bash)
eval "$(rbenv init - zsh)"
