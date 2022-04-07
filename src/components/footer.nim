include karax/prelude

proc renderFooter*(): VNode =
  buildHtml:
    footer:
      tdiv(class = "bg-gray-900"):
        tdiv(class = "max-w-2xl mx-auto text-white py-10"):
          tdiv(class = "mt-28 flex flex-col md:flex-row md:justify-between items-center text-sm text-gray-400"):
            p(class = "order-2 md:order-1 mt-8 md:mt-0"):
              text "&copy; Beautiful Footer, 2021."
            tdiv(class = "order-1 md:order-2"):
              span(class = "px-2"):
                text "About us"
              span(class = "px-2 border-l"):
                text "Contact us"
              span(class = "px-2 border-l"):
                text "Privacy policy"
