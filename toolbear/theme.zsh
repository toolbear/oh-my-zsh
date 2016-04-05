: ${TERM_PROFILE:=${ITERM_PROFILE}}
if [[ ${TERM} != 'eterm-color' ]] ; then
  if [[ $TERM_PROFILE =~ '(.*).(light|dark)(.256)?' ]] ; then
    export TERM_BACKGROUND_MODE=$match[2]
    BASE16_SHELL="${HOME}/src/base16-builder/output/shell/${(j,.,)match[1,2]}.sh"
  fi
  [[ -s ${BASE16_SHELL} ]] && source ${BASE16_SHELL}
fi
