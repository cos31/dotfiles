# make unique 'path'
typeset -U path
# add "$HOME/local/bin" to head
path=($HOME/local/bin(N) $path)
path=($HOME/.bin(N) $path)

# environment variables
export H=$HOME

# fpath
typeset -U fpath
fpath=($fpath $HOME/.zsh/functions(N))
