# ADD "https://api.github.com/repos/auvred/dotfiles/commits?per_page=1" latest_commit
# RUN curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash

git clone https://github.com/auvred/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/install.sh
