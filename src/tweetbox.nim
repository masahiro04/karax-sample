import sugar
include karax/prelude
import textarea, counter, button

type
  TweetBox* = object
    tweetText: kstring

func initTweetBox*(): TweetBox =
  result.tweetText = ""

const maxTweetLength = 10

proc render*(tweetBox: var TweetBox): VNode =
  buildHtml(tdiv):
    renderTextarea(onKeyUpProc = (event: Event, node: VNode) => (tweetBox.tweetText = node.value))
    # renderTextarea(onKeyUpProc = (event: Event, node: VNode) => (tweetbox.tweetText = node.value))
    renderCounter(tweetBox.tweetText.len, maxTweetLength)
    renderButton(
      caption = "Submit",
      onClickProc = () => (echo "Send tweet: " & tweetBox.tweetText)
    )


# proc renderTweetBox*(): VNode =
#   buildHtml(tdiv):
#     textarea(onkeyup = (event: Event, node: VNode) => (content = node.value))
#     tdiv:
#       span(text $content.len)
#     button(onclick = () => (echo "Send tweet: " & content)):
#       text "Submit"
