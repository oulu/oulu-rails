$ ->
  i = $.browser.version.original
  i = Math.floor(i)
  if $.browser.original is "msie"
    $('.js-hack').addClass $.browser.original + "-" + i
  else
    $('.js-hack').addClass $.browser.original
  $('.js-hack').addClass $.platform.original