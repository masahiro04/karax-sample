import dom, tables, parseutils

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


proc parseUrlQuery*(query: string, result: var Table[string, string])
    {.deprecated: "use stdlib".} =
    ## Based on copy from Jester. Use stdlib when
    ## https://github.com/nim-lang/Nim/pull/7761 is merged.
    var i = 0
    i = query.skip("?")
    while i < query.len()-1:
      var key = ""
      var val = ""
      i += query.parseUntil(key, '=', i)
      if query[i] != '=':
        raise newException(ValueError, "Expected '=' at " & $i &
                           " but got: " & $query[i])
      inc(i) # Skip =
      i += query.parseUntil(val, '&', i)
      inc(i) # Skip &
      result[$decodeUri(key)] = $decodeUri(val)
