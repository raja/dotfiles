# .dotfiles

## Pragmatic version controlled dotfiles 
```
# See --bare on https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-init.html
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

## Adding dotfiles to the repository
```
vim ~/.zshrc #do some work
dotfiles add ~/.zshrc
dotfiles commit -m "Added zsh config"
dofiles push
```

## Restore dotfiles on a new system
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' >> $HOME/.zshrc
echo ".dotfiles" >> $HOME/.gitignore # avoid weird git recursion issues
git clone --bare git@github.com:raja/dotfiles.git $HOME/.dotfiles

# current shell scope
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
