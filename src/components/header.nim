include karax/prelude

proc renderHeader*(): VNode =
  buildHtml(header(class = "text-gray-100 bg-gray-900 body-font shadow w-full")):
    tdiv(class = "container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center"):
      nav(class = "flex lg:w-2/5 flex-wrap items-center text-base md:ml-auto"):
        a(class = "mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent hover:border-indigo-600"):
          text "About us"
        a(class = "mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent hover:border-indigo-600"):
          text "Products"
        a(class = "mr-5 hover:text-gray-900 cursor-pointer border-b border-transparent hover:border-indigo-600"):
          text "Investors"
