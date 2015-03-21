export EDITOR=emacsclient

if [[ ${EDITOR} == emacs ]] ; then
  EDITOR=emacsclient
  function e () {
    local -aU opts
    opts+=-n
    opts+=(${argv[1,-1]})

    for opt in ${opts} ; do
      case ${opt} in
      -nw|-t|--tty)
        if [[ ${INSIDE_EMACS} ]] ; then
	  printf "stubbornly refusing to open nested emacs frame\n" >/dev/stderr
	  return 1
	fi
      esac
    done
    ${EDITOR} ${opts[@]}
  }
fi
