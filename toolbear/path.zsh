path=(
  $HOME/bin
  /usr/local/bin
  "$path[@]"
)
typeset -U path

path+=/Applications/p4merge.app/Contents/MacOS
