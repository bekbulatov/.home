# Report the current Arc branch to Herdr as the custom workspace token
# $arc_branch. Outside an Arc repository the token is cleared.

autoload -Uz add-zsh-hook

typeset -g _HERDR_ARC_BRANCH_LAST=''
typeset -gi _HERDR_ARC_BRANCH_INITIALIZED=0

_herdr_arc_branch_precmd() {
  emulate -L zsh

  # The hook may also be loaded in ordinary terminals.
  [[ -n ${HERDR_WORKSPACE_ID:-} ]] || return 0
  (( $+commands[herdr] )) || return 0

  local info=''
  local branch=''

  # arc info fails outside an Arc repository. Suppress the expected error and
  # leave branch empty so any previously reported value gets cleared.
  if (( $+commands[arc] && $+commands[jq] )) &&
     info=$(command arc info --json 2>/dev/null); then
    branch=$(
      print -rn -- "$info" |
        command jq -r '.branch // empty' 2>/dev/null
    ) || branch=''
  fi

  # Avoid a socket request on every prompt when the branch did not change.
  if (( _HERDR_ARC_BRANCH_INITIALIZED )) &&
     [[ $branch == $_HERDR_ARC_BRANCH_LAST ]]; then
    return 0
  fi

  if [[ -n $branch ]]; then
    command herdr workspace report-metadata "$HERDR_WORKSPACE_ID" \
      --source arc-vcs \
      --token "arc_branch=$branch" >/dev/null 2>&1
  else
    command herdr workspace report-metadata "$HERDR_WORKSPACE_ID" \
      --source arc-vcs \
      --clear-token arc_branch >/dev/null 2>&1
  fi

  if (( $? == 0 )); then
    _HERDR_ARC_BRANCH_LAST=$branch
    _HERDR_ARC_BRANCH_INITIALIZED=1
  fi

  # A precmd hook must not affect prompt rendering or command status.
  return 0
}

# Keep repeated `source ~/.zshrc` calls idempotent.
add-zsh-hook -d precmd _herdr_arc_branch_precmd 2>/dev/null
add-zsh-hook precmd _herdr_arc_branch_precmd
