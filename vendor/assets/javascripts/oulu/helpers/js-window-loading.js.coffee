$('.page').ready ->
  $ ->
    $('.js-window-loading').fadeOut()
    $('.page').fadeIn()

$(document).bind "page:restore", handler ->
  $('.js-window-loading').fadeOut()

$ ->
  $('a').not("a[href^=#]").click ->
    $('.js-window-loading').fadeIn()
