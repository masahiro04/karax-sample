when defined(js):
  include karax/prelude
  import httpcore
  import ../../components/card

  type
    BlogShow* = ref object
      status: HttpCode
      content: kstring

  proc newBlogShow*(): BlogShow =
    BlogShow(
      status: Http200
    )

  # TODO(okubo): ダブっている？からかエラー出る
  proc render*(state: BlogShow): VNode =
    buildHtml(tdiv):
      tdiv:
        text "hdsadadsadsaogaae!!!"


