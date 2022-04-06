import sugar
include karax/prelude

proc renderButton*(caption: string, onClickProc: () -> void): Vnode =
  buildHtml:
    button(onclick = onClickProc):
      text caption
