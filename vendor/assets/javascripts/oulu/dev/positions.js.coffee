$ ->
  $("body").mousemove (e) ->
    mouseX = e.pageX
    mouseY = e.pageY
    $("#mouseX").val mouseX
    $("#mouseY").val mouseY
