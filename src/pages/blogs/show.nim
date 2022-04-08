when defined(js):
  include karax/prelude
  import httpcore, options
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
  proc render*(state: BlogShow, blogId: Option[int]): VNode =
    buildHtml(tdiv):
      tdiv:
        text "hdsadadsadsaogaae!!!"


