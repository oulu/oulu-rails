$ ->
  svgeezy.init false, "png"
  $(".fixping").fixPng()

  $(".pie").each ->
    PIE.attach this
