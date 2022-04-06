include karax/prelude

proc createDom(): VNode =
  result = buildHtml(tdiv):
    text "Hellosss world"

setRenderer(createDom)
