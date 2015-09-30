If you have pre-existing `.tmux.conf`, `.vimrc`, `.vim/` you should rename them as `make` script will create symlinks for the two previous and most likely overwrite the later.

If you have a pre-existing `.zshrc` rename it to `.zshrc.user`

run `make` 
*You may need to `chmod a+x scripts/symlink_dotfiles`*

All should work beautifully except you will have to `cd` into YouCompleteMe vim bundle and compile. Beware: This can be a horrible experience if your vim/local machine is using brew python.

Instructions Gist, same as below: https://gist.github.com/dtothefp/a9bc996f9e0450b1dc23

```sh
## Most importantly change your keybindings
# system preferences > keyboard >modifier keys => map caps lock to ctrl for all devices you use, i.e. laptop, external keypboard
# download Karabiner https://pqrs.org/osx/karabiner/
# go to "change the ctrl-l key > Ctrl-l to Ctrl-l > when you type Ctrl-l only, send escape" not jk BS to move out of insert mode
# go to "key repeat" tab and crank up your setting for super fast scrolling in vim

#### .tmux.conf
unbind C-b
set -g prefix C-Space
bind Space send-prefix

#######This is a plugin loader similar to Vundle for VIM######
#God bless this guy https://github.com/tmux-plugins/tpm
# List of plugins
# prefix + I to install the plugins
# prefix + U to update the plugins
# Supports `github_username/repo` or full git repo URLs
set -g @tpm_plugins '              \
  tmux-plugins/tpm                 \
  tmux-plugins/tmux-sensible       \
  tmux-plugins/tmux-copycat        \
  tmux-plugins/tmux-yank           \
'

#### copy fonts from yadr dotfiles into Library/fonts
https://github.com/skwp/dotfiles/tree/master/fonts

#### install Input fonts
http://input.fontbureau.com/

#### use a version of solarized that works with npm chalk color grey
https://github.com/hydrozen/solarized
https://github.com/mbadolato/iTerm2-Color-Schemes

#### use tmux plugin manager to make copy/paste suck less
https://github.com/tmux-plugins/tpm

#### setup You Complete Me for vim 
https://github.com/Valloric/YouCompleteMe#mac-os-x-super-quick-installation

#### .zshrc
alias rmall="nvm use 0.12 && rm -rf node_modules && npm cache clear && npm i"
alias tmn="tmux new -s DTOTHEFP -n HipsterSh\#\%"
alias tmk="tmux kill-session"

$ rmall #remove all node modules, switch to node version of choice and reinstall
$ tmn #start a new tmux session with a cool name
$ tmk #kill your tmux session

#### .tmux.conf commands
prefix = space
prefix-c #new tmux window
prefix-` #scroll/copy in terminal using vim key bindings
#### if using copy/paste plugins scroll manually in terminal with track pad, highlight text and press `y` to yank
prefix-, #rename a tab
prefix-s #new tmux horizontal split
prefix-v #new tmux vertical split
prefix-x #kill tmux split or window
prefix-shift-l #navigate right between tmux window
prefix-shift-h #navigate left between tmux window
prefix-h | prefix-l #resize vertical pane
prefix-j | prefix-k #resize horizontal pane
ctrl-j #to pane above
ctrl-k #to pane below
ctrl-h #to left pane
ctrl-l #to right pane
#above 4 commands are same for vim navigating through tabs

#### vim
leader = ,
leader-d #toggle open nerd tree
####NerdTree
t #open new tab
s #vertical split
i #horizontal split
shift-C #change base of nerdtree
o #open expanded file tree
x #close expanded file tree
leader-l | leader-h | leader-j | leader-k #move between vim splits adn tmux panes.
shift-l | shift-h #move betwee vim tabs
leader-p | leader-shift-p #paste from buffer, nice shortcut for pasting stuff from outside of vim into vim
# Paste form clipboard register
nnoremap <leader>P "+P

leader-cc #comment out a bunch of highligted text
leader-c-space #uncomment highlighted text
"ay #save highligted text in `a` buffer to use later
"ap or "aP #paste from the `a` buffer
leader-r #refresh all your buffers after a change like checking out a branch
# refresh all the buffers
nnoremap <leader>r :checktime<cr>
leader-f #show indentation guides
leader-w #strip whitespace
ctrl-g-leader #use emmet autocompletion, in insert mode
ctrl-f #instert a snippet, in insert mode
leader-ve #open your .vimrc in a vertical split
leader-sv #source your .vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
```
