$('.page').ready ->
  $ ->
    $('.js-window-loading').fadeOut()
    $('.page').fadeIn()
    return
  return

$ ->
  $('a').not("a[href^=#]").click ->
    $('.js-window-loading').fadeIn()
    return
