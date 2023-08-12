ssh_for_gh_repo() {
  if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]; then
    git config gpg.format ssh
    # should be mounted
    git config user.signingkey $HOME/.ssh/id_ed25519_auvred_sign.pub
    git config commit.gpgsign true
    git config tag.gpgsign true
    git config user.name auvred
    git config user.email aauvred@gmail.com

    if [[ $(git config remote.origin.url) = "https://github.com/auvred/dotfiles.git" ]]; then
      git remote set-url origin git@github.com:auvred/dotfiles
    fi
  else
    echo "you're not inside of the git repo"
  fi
}

# For dotfiles management
dotf() {
  if [[ -z $1 ]]; then
    if [[ $PWD == $DOTFILES_DIR ]]; then
      if [ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]; then
        return 0
      fi
      git init
      git remote add origin https://github.com/auvred/dotfiles
      git fetch
      git branch master origin/master
      git reset HEAD
      git rebase --autostash
      ssh_for_gh_repo
    else
      cd $DOTFILES_DIR
    fi
  elif [[ $1 == vi ]]; then
    cd $DOTFILES_DIR/.config/nvim
  fi
}
