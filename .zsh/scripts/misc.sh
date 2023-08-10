alias ll="exa -lha"
alias vi="nvim"
alias fd="fdfind"

function sshag() {
  eval $(ssh-agent -s)
}

function ssha() {
  sshag

  for key in $HOME/.ssh/id_*; do
    if grep -q PRIVATE "$key"; then
      ssh-add "$key"
    fi
  done
}
