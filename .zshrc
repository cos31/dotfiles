##################################################
# shell variables

### history

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

function history-all { history -E 1 } # 全履歴の一覧を出力する

### prompt

# プロンプトのカラー表示を有効
autoload -U colors
colors

## vcs setting
# http://d.hatena.ne.jp/mollifier/20100906/p1
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  # この check-for-changes が今回の設定するところ
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '[%s %b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '[%s %b|%a] %c%u'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{red}%1v%f|)"


# tramp経由の場合以外に変更するようにする
case "$TERM" in
    dumb | emacs)
        PROMPT="%m:%~> "
        unsetopt zle
    ;;
esac


## Default shell configuration
#
# set prompt
# http://blog.soi33.org/archives/96
#
case ${UID} in
0)
    PROMPT="%{^[[31m%}%/%%%{^[[m%}%b "
    PROMPT2="%{^[[31m%}%_%%%{^[[m%} "
    SPROMPT="%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[32m%}%m%{[m%}:%{[34m%}%B%~%b%}%{[m%} %% "
    PPROMPT='%{[30m%}${vcs_info_msg_0_}%{[m%}'
    SPROMPT="%B%{^[[31m%}%r is correct? [n,y,a,e]:%{^[[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
         PROMPT="%{^[[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac


##################################################
### set aliases

case "$OSTYPE" in
    darwin*)
        alias ls="LSCOLORS=gxfxxxxxcxxxxxxxxxxxxx ls -G"
        ;;
    linux*)
        alias ls="ls --color=auto"
        ;;
esac

alias ll="ls -l"
alias la="ll -a"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias eo="open -a 'emacs'"
alias tree='tree -CN'
alias svn=colorsvn
alias diff=colordiff
alias grep='grep --color=auto'


##################################################
### others

### completion

# デフォルトの補完機能を有効
autoload -Uz compinit
compinit

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B-- %d --%b'

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ln=35 di=36

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# いろいろと表示する
zstyle ':completion:*' verbose yes
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

## git completion
if [ -e $HOME/.git-completion.sh ]; then
    source $HOME/.git-completion.sh
fi

### Set shell options

# C-s, C-qを無効にする。
setopt no_flow_control

# 先頭がスペースならヒストリーに追加しない。
setopt hist_ignore_space

# リダイレクトで上書きする事を許可しない。
#setopt no_clobber

# ベルを鳴らさない。
setopt no_beep

# ^Dでログアウトしないようにする。
setopt ignore_eof

# ^Iで補完可能な一覧を表示する。(曖昧補完)
setopt auto_list

# cdでpushdする。
setopt auto_pushd

# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# globを拡張する。
setopt extended_glob

# 補完時にスペルチェックをする。
#setopt auto_correct

# リターンを押す度にスペルチェックをする。
#setopt correct
#setopt correct_all

# 補完時にヒストリを自動的に展開する。
setopt hist_expand

# pushd を引数無しで実行した時に pushd ~ とする。
setopt pushd_to_home

# ディレクトリ名だけで移動できる。
setopt auto_cd

# rm * を実行する前に確認する
#setopt rmstar_wait

# カレントディレクトリ中にサブディレクトリが
# 見付からなかった場合に cd が検索する
# ディレクトリのリスト
cdpath=($HOME)

# ログインとログアウトを監視する。
#watch=(all all)
# 全部監視
watch="all"
# 10分おき(デフォルトは1分おき)
#LOGCHECK="$[10 * 60]"
# 取りあえず表示してみる
log

# 10分後に自動的にログアウトする。
#setopt autologout=10

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 履歴ファイルに時刻を記録
setopt extended_history

# 履歴をインクリメンタルに追加
setopt inc_append_history

# 履歴の共有
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# coreのサイズ
limit coredumpsize 0

# 3秒以上かかった処理は詳細表示
REPORTTIME=3

### end of file
