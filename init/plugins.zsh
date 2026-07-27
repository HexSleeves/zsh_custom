#
# antidote: Fast plugin management
#

typeset -gU fpath path

zstyle ":zsh_custom:plugins" use-antibody true
if zstyle -t ":zsh_custom:plugins" use-antibody; then
  if ! (( $+commands[antibody] )); then
    path=(/opt/homebrew/bin(N) $path)
  fi

  if ! (( $+commands[antibody] )); then
    echo >&2 "__init__: antibody command not found. many plugins will not work."
    return 1
  fi

  source <(antibody init)
  function plugin() {
    antibody "$@"
  }
else
  #source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
  source $HOME/Projects/mattmc3/antidote/antidote.zsh
  source <(antidote init)
  function plugin() {
    antidote "$@"
  }
fi
