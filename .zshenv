# make unique 'path'
typeset -U path
# add "$HOME/local/bin" to head
path=($HOME/local/bin(N) $path)
path=($HOME/.bin(N) $path)
path=(/usr/local/bin(N) $path)

# environment variables
export H=$HOME

# fpath
typeset -U fpath
fpath=($fpath $HOME/.zsh/functions(N))
export PATH=/usr/local/libexec:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
