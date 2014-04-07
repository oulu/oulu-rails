$ ->
  $("body").mousemove (e) ->
    mouseX = e.pageX
    mouseY = e.pageY
    $("#mouseX").val mouseX
    $("#mouseY").val mouseY

  # get scroll amount.
  window.onscroll = ->
    scrollX = document.documentElement.scrollLeft
    scrollY = document.documentElement.scrollTop
    $("#scrollX").value = scrollX
    $("#scrollY").value = scrollY

  $("#js-target-field").mousemove (e) ->
    divMouseX = undefined
    divMouseY = undefined
    offsetX = 0
    offsetY = 0
    element = this
    scrollX = document.documentElement.scrollLeft
    scrollY = document.documentElement.scrollTop
    while element
      offsetX += element.offsetLeft
      offsetY += element.offsetTop
      element = element.offsetParent
    if e
      divMouseX = e.pageX - offsetX
      divMouseY = e.pageY - offsetY
    else
      divMouseX = event.pageX + document.body.scrollLeft - offsetX
      divMouseY = event.pageY + document.body.scrollTop - offsetY
    $("#divMouseX").value divMouseX
    $("#divMouseY").value divMouseY
