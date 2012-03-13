path=(
  $HOME/bin
  /usr/local/bin
  /usr/local/share/python
  "$path[@]"
)
typeset -U path

path+=/Applications/p4merge.app/Contents/MacOS
