include karax/prelude
import tweetbox
import components/footer

type
  State = object
    tweetbox: TweetBox

func initState(): State =
  result.tweetbox = initTweetBox()
  # result.anotherTweetBox = initTweetBox()

proc main() =
  var state = initState()

  proc render(): VNode =
    buildHtml(tdiv):
      # head:
      #   title(text "hogehogek")
      # link(href = "https://cdn.jsdelivr.net/npm/daisyui@2.13.6/dist/full.css", rel = "stylesheet", type = "text/css" )
      # link(href ="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" , rel = "stylesheet", type = "text/css" )
      # script(src="https://cdn.tailwindcss.com")
      h1(text "Hello world")

      render state.tweetbox

      renderFooter()
      # render state.anotherTweetBox
  # addScript "https://cdn.tailwindcss.com"
  # addStylesheet "https://cdn.jsdelivr.net/npm/daisyui@2.13.6/dist/full.css"
  # loadScript("https://cdn.tailwindcss.com")
  # addStylesheet "https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css"
  # addStylesheet "https://cdn.jsdelivr.net/npm/daisyui@2.13.6/dist/full.css"
  setRenderer render

# when isMainModuke:
main()
