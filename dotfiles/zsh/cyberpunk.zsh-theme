# Define colors
local fg_red="%{$fg[red]%}"
local fg_cyan="%{$fg[cyan]%}"
local fg_green="%{$fg[green]%}"
local bg_red="%{$bg[red]%}"
local fg_black="%{$fg[black]%}"
local reset="%{$reset_color%}"

git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "${bg_red}${fg_black} $(git_current_branch) ${reset} "
  fi
}

# Set the prompt
PROMPT='${fg_cyan}%n${reset}@${fg_red}%m${reset}: ${fg_green}%~${reset} $(git_custom_status)\$ '
