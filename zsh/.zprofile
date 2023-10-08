if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx | tee $HOME/.local/share/xorg/startx.log
fi
