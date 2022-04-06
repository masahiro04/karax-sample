include karax/prelude
import tweetbox

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
      h1(text "Hello world")

      render state.tweetbox
      # render state.anotherTweetBox

  setRenderer render

# when isMainModuke:
main()
