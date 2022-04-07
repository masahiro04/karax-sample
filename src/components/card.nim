include karax/prelude

proc renderCard*(): VNode =
  buildHtml(tdiv(class = "max-w-2xl mx-auto sm:px-6 lg:px-8")):
    tdiv(class = "overflow-hidden shadow-md"):
      tdiv(class = "px-6 py-4 bg-white border-b border-gray-200 font-bold uppercase"):
        text "What is Lorem Ipsum?"
      tdiv(class = "p-6 bg-white border-b border-gray-200"):
        text """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a typej
        specimen book.
        """
      tdiv(class = "p-6 bg-white border-gray-200 text-right"):
        a(class = "bg-blue-500 shadow-md text-sm text-white font-bold py-3 md:px-8 px-4 hover:bg-blue-400 rounded uppercase"):
          text "Click me!"

