root_dir := $(shell pwd)
vim_bundle_dir = $(HOME)/.vim/bundle
vundle = $(HOME)/.vim/bundle/Vundle.vim
dotfiles = $(HOME)/.dotfiles
vimrc = $(HOME)/.vimrc
bin_dir = /usr/local/bin
brew = $(bin_dir)/brew
tmux = $(bin_dir)/tmux

vimbundles: $(vimrc) $(vundle)
	vim +BundleInstall! +BundleClean +qall

symlinks: $(dotfiles) $(tmux)
	$(root_dir)/scripts/symlink_dotfiles

$(dotfiles): $(root_dir)
	rm -rf $(dotfiles)
	ln -s $(root_dir) $(dotfiles)

$(vim_bundle_dir):
	mkdir -p $(vim_bundle_dir)

$(vundle): $(vim_bundle_dir)
	git clone http://github.com/gmarik/Vundle.vim.git $(vundle)

$(vimrc): symlinks
