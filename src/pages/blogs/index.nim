when defined(js):
  include karax/prelude
  import httpcore
  import ../../components/card

  type
    BlogIndex* = ref object
      status: HttpCode
      content: kstring

  proc newBlogIndex*(): BlogIndex =
    BlogIndex(
      status: Http200
    )

  # TODO(okubo): ダブっている？からかエラー出る
  proc render*(state: BlogIndex): VNode =
    buildHtml(tdiv):
      tdiv:
        renderCard()
        renderCard()
        renderCard()
        renderCard()
        text "hdsadadsadsaogaae!!!"
