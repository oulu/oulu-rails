try
  window.addEventListener "load", (->

    # get mouse coords at window.
    window.onmousemove = (e) ->
      mouseX = undefined
      mouseY = undefined
      if e
        mouseX = e.pageX
        mouseY = e.pageY
      else
        mouseX = event.pageX + document.body.scrollLeft
        mouseY = event.pageY + document.body.scrollTop
      document.getElementById("mouseX").value = mouseX
      document.getElementById("mouseY").value = mouseY


    # get scroll amount.
    window.onscroll = ->
      scrollX = document.documentElement.scrollLeft
      scrollY = document.documentElement.scrollTop
      document.getElementById("scrollX").value = scrollX
      document.getElementById("scrollY").value = scrollY


    # get mouse coords at targetDiv.
    document.getElementById("js-target-field").onmousemove = (e) ->
      mouseX = undefined
      mouseY = undefined
      offsetX = 0
      offsetY = 0
      element = this
      while element
        offsetX += element.offsetLeft
        offsetY += element.offsetTop
        element = element.offsetParent
      if e
        mouseX = e.pageX - offsetX
        mouseY = e.pageY - offsetY
      else
        mouseX = event.pageX + document.body.scrollLeft - offsetX
        mouseY = event.pageY + document.body.scrollTop - offsetY
      document.getElementById("divMouseX").value = mouseX
      document.getElementById("divMouseY").value = mouseY


    # get Window Size.
    window.onresize = (e) ->
      w = window.innerWidth
      h = window.innerHeight
      document.getElementById("windowW").value = w
      document.getElementById("windowH").value = h

    document.getElementById("windowW").value = window.innerWidth
    document.getElementById("windowH").value = window.innerHeight
    prettyPrint()
  ), false