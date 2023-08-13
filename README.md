# My dotfiles

To install in a docker:

```shell
ADD "https://api.github.com/repos/auvred/dotfiles/commits?per_page=1" latest_commit
RUN curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash
```
