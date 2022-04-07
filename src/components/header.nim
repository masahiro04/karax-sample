include karax/prelude

proc renderHeader*(): VNode =
  buildHtml():
    tdiv(class = "navbar bg-neutral text-neutral-content"):
      a(class="btn btn-ghost normal-case text-xl"):
        text "hoge"
