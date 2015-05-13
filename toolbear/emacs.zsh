case ${EDITOR} in
  emacs|emacsclient*)
    if [ ${INSIDE_EMACS} ] ; then
      export EMACS_SOCKET=${EMACS_SOCKET:-$(basename $(lsof -U -a -p $(ps -p $$ -o ppid=) |awk '$1 == "Emacs" { print $8; exit; }'))}
    fi
    export EDITOR="emacsclient ${EMACS_SOCKET+-s ${EMACS_SOCKET}}"
    function e () {
      local -aU opts
      opts+=-n
      opts+=(${argv[1,-1]})
      if [ ${INSIDE_EMACS} ] ; then
        opts+=-s
        opts+=${EMACS_SOCKET}
        for opt in ${opts} ; do
          case ${opt} in
            -nw|-t|--tty)
              printf "stubbornly refusing to open nested emacs frame\n" >/dev/stderr
              return 1
          esac
        done
      fi
      emacsclient ${opts[@]}
    }
esac
