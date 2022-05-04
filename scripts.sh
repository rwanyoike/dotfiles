#!/usr/bin/env bash

set -euo pipefail

SCRIPTS=$(chezmoi source-path)/scripts

ui_sgr0=$(tput sgr0)
ui_002=$(tput setaf 2)
ui_bold=$(tput bold)

# ${1}: message
function dotfiles_print() {
  printf "${ui_bold}${ui_002}%s${ui_sgr0}\n" "${1}"
}
export -f dotfiles_print

# ${1}: repo
# ${2}: dest
function dotfiles_git() {
  if [[ ! -d ${2} ]]; then
    git clone --depth 1 "${1}" "${2}"
  fi
  cd "${2}" || exit 1
  git pull
}
export -f dotfiles_git

if [[ -d ${SCRIPTS} ]]; then
  dotfiles_print "--> execute ${SCRIPTS}"
  for file in "${SCRIPTS}"/*.sh; do
    dotfiles_print "  $ ./$(basename "${file}")"
    bash "${file}" || break
  done
fi
