include karax/prelude
import tweetbox, utils, tables, sugar, httpcore
import components/footer
import components/header
import components/card
import pages/blogs/index
import pages/blogs/show
import pages/error

from dom import window, Location, document, decodeURI

type
  State = ref object
    originalTitle: cstring
    url: Location
proc copyLocation(loc: Location): Location =
  Location(
    hash: loc.hash,
    host: loc.host,
    hostname: loc.hostname,
    href: loc.href,
    pathname: loc.pathname,
    port: loc.port,
    protocol: loc.protocol,
    search: loc.search
  )


proc newState(): State =
  State(
    originalTitle: document.title,
    url: copyLocation(window.location),
  )

var state = newState()

proc onPopState(event: dom.Event) =
  echo "New URL: ", window.location.href, " ", state.url.href
  document.title = state.originalTitle
  if state.url.href != window.location.href:
    state = newState()
  state.url = copyLocation(window.location)

  redraw()


type Params = Table[string, string]
type
  Route = object
    n: string
    p: proc (params: Params): VNode

proc r(n: string, p: proc (params: Params): VNode): Route = Route(n: n, p: p)
proc route(routes: openarray[Route]): VNode =
  let path =
    if state.url.pathname.len == 0: "/" else: $state.url.pathname
  echo "----------------"
  # echo $path
  # echo $state.url.pathname
  # echo $routes
  # let prefix = if appName == "/": "" else: appName
  let prefix = "/"
  
  for route in routes:
    # echo route.n
    # let pattern = (prefix & route.n).parsePattern()
    let pattern = (prefix & route.n)
    # var (matched, params) = pattern.match(path)
    # parseUrlQuery($state.url.search, params)
    # if matched:
    # return route.p(params)
    # TODO(okubo): table方でparams渡せばいける
    return route.p({ "hoge": "hoge" }.toTable)
  echo $result

  echo "----------------"
  return renderError("Unmatched route: " & path, Http500)



proc main() =
  # var state = initState()

  proc render(): VNode =
    buildHtml(tdiv):
      renderHeader()
      route([
        r("/", (params: Params) => (renderBlogIndex())),
        r("/blogs", (params: Params) => (renderBlogIndex())),
        r("/blogs/@id", (params: Params) => (renderBlogShow()))
      ])
      renderCard()
      renderCard()
      renderCard()
      renderCard()
      # render state.tweetbox
      renderFooter()

  window.onPopState = onPopState
  setRenderer render
  addStylesheet "https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"

main()
