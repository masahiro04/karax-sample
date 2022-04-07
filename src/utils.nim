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

const appName* = "/"


when defined(js):
  include karax/prelude
  import karax / [kdom, kajax]

  from dom import nil

  proc makeUri*(relative: string, appName=appName, includeHash=false,
                  search: string=""): string =
      ## Concatenates ``relative`` to the current URL in a way that is
      ## (possibly) sane.
      var relative = relative
      assert appName in $window.location.pathname
      if relative[0] == '/': relative = relative[1..^1]

      return $window.location.protocol & "//" &
              $window.location.host &
              appName &
              relative &
              search &
              (if includeHash: $window.location.hash else: "")
  proc makeUri*(relative: string, params: varargs[(string, string)],
                appName=appName, includeHash=false,
                reuseSearch=true): string =
    var query = ""
    for i in 0 ..< params.len:
      let param = params[i]
      if i != 0: query.add("&")
      query.add(param[0] & "=" & param[1])

    if query.len > 0:
      var search = if reuseSearch: $window.location.search else: ""
      if search.len != 0: search.add("&")
      search.add(query)
      if search[0] != '?': search = "?" & search
      makeUri(relative, appName, search=search)
    else:
      makeUri(relative, appName)
  proc navigateTo*(uri: cstring) =
    # TODO: This was annoying. Karax also shouldn't have its own `window`.
    dom.pushState(dom.window.history, 0, cstring"", uri)

    # Fire the popState event.
    dom.dispatchEvent(dom.window, dom.newEvent("popstate"))

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
