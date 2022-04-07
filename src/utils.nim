import dom

proc addStyleSheet*(href: string) =
  var css = document.createElement("link")
  css.setAttribute("href", href)
  css.setAttribute("rel", "stylesheet")
  document.head.appendChild(css)

proc addScript*(src: string) =
  var js = document.createElement("script")
  js.setAttribute("src", src)
  js.setAttribute("type", "text/javascript")
  document.head.appendChild(js)
