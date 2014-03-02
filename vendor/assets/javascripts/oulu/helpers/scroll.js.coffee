$ ->
  $("a[href^=#]").click ->
    speed = 200 # ミリ秒
    href = $(this).attr("href")
    target = $((if href is "#" or href is "" then "html" else href))
    position = target.offset().top #targetの位置を取得
    $((if $.browser.safari then "body" else "html")).animate
      scrollTop: position
    , speed, "swing"
    false

  return
