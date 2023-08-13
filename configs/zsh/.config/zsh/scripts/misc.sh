alias ll="exa -lha"
alias fd="fdfind"

sshag() {
  eval $(ssh-agent -s)
}

ssha() {
  sshag

  for key in $HOME/.ssh/id_*; do
    if grep -q PRIVATE "$key"; then
      ssh-add "$key"
    fi
  done
}

sshk() {
  ssh-agent -k
}

trim_trailing_whitespaces() {
  for target in $@; do
    if [[ -d $target ]]; then
      find $target -type f -print0 | xargs -0 sed -i 's/[ \t]*$//'
    elif [[ -f $target ]]; then
      sed -i 's/[ \t]*$//' $target
    fi
  done
}
