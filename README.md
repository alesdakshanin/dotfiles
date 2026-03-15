# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a package that mirrors `~`.

```bash
brew install stow
stow -t ~ fish      # install a package
stow -t ~ -D fish   # uninstall
stow -t ~ */        # install all
```
