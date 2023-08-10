function ssh_for_gh_repo() {
  if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]; then
    git config gpg.format ssh
    # should be mounted
    git config user.signingkey /home/auvred/.ssh/id_ed25519_auvred_sign.pub
    git config commit.gpgsign true
    git config tag.gpgsign true
    git config user.name auvred
    git config user.email aauvred@gmail.com
  else
    echo "you're not inside of the git repo"
  fi
}
