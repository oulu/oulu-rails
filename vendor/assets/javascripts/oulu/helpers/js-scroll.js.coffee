$ ->
  $(".js-scroll").click ->
    speed = 200
    href = $(this).attr("href")
    target = $((if href is "#" or href is "" then "html" else href))
    position = target.offset().top
    $("html, body").animate
      scrollTop: position
    , speed, "swing"
