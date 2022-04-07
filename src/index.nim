include karax/prelude
import tweetbox, utils
import components/footer
import components/header

type
  State = object
    tweetbox: TweetBox

func initState(): State =
  result.tweetbox = initTweetBox()

proc main() =
  var state = initState()

  proc render(): VNode =
    buildHtml(tdiv):
      renderHeader()
      h1(text "Hello world")
      render state.tweetbox
      renderFooter()
  setRenderer render
  addStylesheet "https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
  # addStylesheet "https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css"

main()
