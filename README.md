If you have pre-existing `.tmux.conf`, `.vimrc`, `.vim/` you should rename them as `make` script will create symlinks for the two previous and most likely overwrite the later.

If you have a pre-existing `.zshrc` rename it to `.zshrc.user`

run `make` 
*You may need to `chmod a+x scripts/symlink_dotfiles`*

All should work beautifully except you will have to `cd` into YouCompleteMe vim bundle and compile. Beware: This can be a horrible experience if your vim/local machine is using brew python.

## Yet to come

- shortcut explanations for tmux and vim
