include karax/prelude
import utils, tables, sugar, httpcore
import components/footer
import components/header
import components/card
import pages/blogs/index
import pages/blogs/show
import pages/error
import jester/[patterns]

from dom import window, Location, document, decodeURI

type
  State = ref object
    originalTitle: cstring
    url: Location
    blogIndex: BlogIndex
    blogShow: BlogShow

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
    blogIndex: newBlogIndex(),
    blogShow: newBlogShow(),
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
  echo "haitta!!!aaaa"
  let path =
    if state.url.pathname.len == 0: "/" else: $state.url.pathname
  echo "----------------"
  echo $state.url.pathname
  let prefix = if appName == "/": "" else: appName
  for route in routes:
    let pattern = (prefix & route.n).parsePattern()
    # let pattern = (prefix & route.n)
    var (matched, params) = pattern.match(path)
    parseUrlQuery($state.url.search, params)
    if matched:
      return route.p(params)
  return renderError("Unmatched route: " & path, Http500)

# TODO: ここを参考にエラー解消する
# https://github.com/nim-lang/nimforum/blob/master/src/frontend/forum.nim
# https://github.com/nim-lang/nimforum/blob/master/src/frontend/about.nim

proc main() =
  echo "haitta!!!"

  proc render(): VNode =
    buildHtml(tdiv):
      renderHeader()
      text "hogaae!!!"
      route([
        r("/blogs", (params: Params) => (render(state.blogIndex))),
        # r("/blogs", (params: Params) => (renderBlogIndex())),
        # r("/blogs/@id", (params: Params) => (renderBlogShow())),
        r("/", (params: Params) => (render(state.blogShow))),
      ])
      renderFooter()
  echo "hogehoge"
  window.onPopState = onPopState
  setRenderer render
  addStylesheet "https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"

main()
