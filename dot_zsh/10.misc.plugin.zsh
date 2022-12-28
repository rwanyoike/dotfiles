# Ref: http://zsh.sourceforge.net/Doc/Release/Parameters.html
# The file to save the history in when an interactive shell exits
HISTFILE="${HOME}/sync/zhistory"
# The maximum number of events stored in the internal history list
HISTSIZE=51200
# The maximum number of history events to save in the history file
SAVEHIST="${HISTSIZE}"

# Ref: http://zsh.sourceforge.net/Doc/Release/Options.html
# When writing out the history file, older commands that duplicate newer ones are omitted
setopt HIST_SAVE_NO_DUPS

# Ref: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
# Selects  keymap  'emacs'  for  any operations by the current command
bindkey -e

# Ref: https://github.com/zsh-users/zsh-history-substring-search
# Bind zsh-history-substring-search shortcuts
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down

# Ref: https://zsh.sourceforge.io/Doc/Release/User-Contributions.html
# Improve on-line help provided by the shell
unalias run-help
autoload -U run-help
