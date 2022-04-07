include karax/prelude


proc renderBlogIndex*(): VNode =
  buildHtml(tdiv):
    tdiv:
      text "hoge!!!"
