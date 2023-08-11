FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

export FZF_CTRL_T_OPTS="
  --preview 'batcat --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_DEFAULT_COMMAND="fdfind --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -I node_modules -C {} | head -200'"
export FZF_ALT_C_COMMAND="fdfind --type d $FD_OPTIONS"

# autogenerated completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_compgen_path() {
  command fdfind --hidden --follow --exclude .git --exclude node_modules . "$1"
}
_fzf_compgen_dir() {
  command fdfind --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

#
# Inspired by https://github.com/hankchanocd/npm-fzf
#
# Creates fzf prompt with scripts from nearest package.json and then runs selected script
# with `<packageManager> run <script>` (packageManager from package.json if defined, npm otherwise)
#
npr() {
  local current_dir=$PWD
  local packagejson_path

  while
    packagejson_path=$(find "$current_dir"/ -maxdepth 1 -name "package.json")
    [[ -z $packagejson_path ]] && [[ "$current_dir" != $HOME ]]
  do current_dir=$(dirname "$current_dir"); done

  if [ -z $packagejson_path ]; then
    echo package.json not found
    return 1
  fi

  if ! jq empty $packagejson_path 2> /dev/null; then
    echo $packagejson_path is not a valid JSON
    return 1
  fi

  # we need to get $? of fzf after, but 'local' is a builtin command which returns 0
  local script_name_answer
  script_name_answer=$(cat $packagejson_path \
    | jq -r '(.scripts | to_entries | .[] | (
      "\u001b[1;3;33m" 
      + .key 
      + "\u001b[m"
      + (" " * (35 - (.key | length)))
      + " \u001b[32m => \u001b[2;36m" 
      + .value
      + "\u001b[m"))' \
    | fzf \
      --reverse \
      --height=~20 \
      --ansi \
      --border=rounded \
      --margin=1)

  local script_prompt_status=$?
  if [[ "$script_prompt_status" != "0" ]]; then
    return 1
  fi

  local script_name=$(echo $script_name_answer \
    | tr ' ' '\n' \
    | head -n 1)

  local package_manager=$(cat $packagejson_path | jq -r '.packageManager?')

  current_dir=$(dirname "$current_dir")
  packagejson_path=$(find "$current_dir"/ -maxdepth 1 -name "package.json")
  while [ $package_manager = "null" ] && [ "$current_dir" != "$HOME" ]; do
    current_dir=$(dirname "$current_dir")
    packagejson_path=$(find "$current_dir"/ -maxdepth 1 -name "package.json")
    if [ ! -z packagejson_path ]; then
      package_manager=$(cat $packagejson_path | jq -r '.packageManager?')
    fi
  done

  if [[ $package_manager =~ ^(npm|yarn|pnpm)@.+$ ]]; then
    package_manager=$(echo $package_manager | awk '{ split($0, a, "@"); print a[1]}')
  else
    package_manager="npm"
  fi

  local cmd="$package_manager run $script_name"
  echo "Running '\u001b[1;3;32m$cmd\u001b[m'"
  eval "$cmd"
}
