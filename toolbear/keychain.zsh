function keychain() {
  : ${1:=$(mdfind -name \.keychain |selecta)}
  [[ -f $1 ]] || : ${1::=$(mdfind -name \.keychain |selecta -s $1)} || return $?
  security unlock-keychain $1 || return $?
  security set-keychain-settings -lut $((60*60*24)) $1 || return $?

  local -aU chains
  chains+=("${(f)=$(security list-keychains -d user):gs/    //:Q}")
  chains+=($1)
  security list-keychains -d user -s ${(Q)chains}
  echo "${(F)chains}"
}
