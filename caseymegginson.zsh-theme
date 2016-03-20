# ZSH Theme based on the bira theme with some of my own customizations
# for things like roots' prompt being red.

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{%(#~$fg_bold[red]~$fg_bold[green])%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local current_time='⌚ %{$fg_bold[cyan]%}%*%{$reset_color%}'

PROMPT="╭${user_host} ${current_dir} ${git_branch} ${current_time}
╰%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
