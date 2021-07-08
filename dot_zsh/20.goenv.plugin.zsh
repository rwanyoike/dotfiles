# Ref: https://github.com/syndbg/goenv

export GOENV_GOPATH_PREFIX="${XDG_DATA_HOME}/go"
export PATH="${HOME}/.goenv/bin:${PATH}"
if command -v goenv &> /dev/null; then
  eval "$(goenv init -)"
  export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"
fi
