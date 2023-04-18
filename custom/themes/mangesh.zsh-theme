# Show the machine name other than the most used one.
local_machines=("PAC02LC18LFFT3" "PA-MBP-C02LC18LFFT3" "garfield" "PAC02C10WXMD6P")

local hostname=${(%):-%m}
local machine_name=''
if [[ ${local_machines[(r)$hostname]} != $hostname ]]; then
    local machine_name="%m:"
fi

special_users=("root" "hadoop")
local user_prefix=""
if [[ ${special_users[(r)$USERNAME]} = $USERNAME ]]; then
    local user_prefix="%{$fg[red]%}%n@%{$reset_color%}"
fi

PROMPT='$user_prefix%{$fg[green]%}$machine_name%{$fg[cyan]%}%3~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg[cyan]%}%% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# function _recover_line_or_else() {
#   if [[ -z $BUFFER && $CONTEXT = start && $zsh_eval_context = shfunc
#         && -n $ZLE_LINE_ABORTED
#         && $ZLE_LINE_ABORTED != $history[$((HISTCMD-1))] ]]; then
#     LBUFFER+=$ZLE_LINE_ABORTED
#     unset ZLE_LINE_ABORTED
#   else
#     zle .$WIDGET
#   fi
# }
# zle -N up-line-or-history _recover_line_or_else
# function _zle_line_finish() {
#   ZLE_LINE_ABORTED=$BUFFER
# }
# zle -N zle-line-finish _zle_line_finish

# function up-line-or-local-history() {
#     zle set-local-history 1
#     zle up-line-or-history
#     zle set-local-history 0
# }
# zle -N up-line-or-local-history

# function down-line-or-local-history() {
#     zle set-local-history 1
#     zle down-line-or-history
#     zle set-local-history 0
# }
# zle -N down-line-or-local-history

# # History
# bindkey "^[^[[A" up-line-or-local-history    # [windows] + Cursor up
# bindkey "^[^[[B" down-line-or-local-history  # [windows] + Cursor down
# bindkey '^R' history-incremental-pattern-search-backward

# autoload -Uz copy-earlier-word
# zle -N copy-earlier-word
# bindkey "^[M" copy-earlier-word

# Completion for ssh connections.
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_hosts}(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
