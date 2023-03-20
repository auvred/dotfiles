# My dotfiles

To install run the following:
```bash
curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash
```

To install in a docker:
```
ADD "https://api.github.com/repos/auvred/dotfiles/commits?per_page=1" latest_commit
RUN curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash
```