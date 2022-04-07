include karax/prelude

proc renderBlogShow*(): VNode =
  buildHtml(tdiv):
    text "Blog show!"
