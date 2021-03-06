# vim-dotfiles

These are my vim dotfiles.  There are many like
them, but these are mine.

## Installation / Bootstrap

### Vimrc

Vim reads your configuration settings from ~/.vimrc, so you need to
link/move =vimrc= from this project to your ~/.vimrc file.

One way to do that is:

```bash
cd ~
git clone https://github.com/NathanNeff/vim-dotfiles.git
mv ~/.vimrc ~/.vimrcbackup # can't be too safe
ln -s vim-dotfiles/vimrc ~/.vimrc
```

TL;DR The plugins I use are *not* part of this Git repository
(not even as submodules).

Therefore, in order to exactly replicate the functionality
in these vim-dotfiles you need to:

```bash
cd ~/.vim
mkdir bundle && cd bundle
git clone https://github.com/tpope/vim-pathogen.git
```

See "Can I put pathogen.vim in a submodule like all my other plugins?" section
of https://github.com/tpope/vim-pathogen

## Installed Plugins

* Vim-Scala

=git clone https://github.com/derekwyatt/vim-scala.git ~/.vim/bundle=

* NERDTree

=git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle=

* CtrlP

=git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim=


## Adding plugins

You simply need to git-clone new plugins to the =bundle= subdirectory
(See "Installed Plugins" above)

To initialize the help tags, run =:Helptags= in vim, which will
go through all dirs in =bundle= and add the documentation to Vim's
help section. (This is a part of =pathogen=, not mine)
