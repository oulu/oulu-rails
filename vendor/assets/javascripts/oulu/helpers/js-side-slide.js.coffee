$ ->
  $('.js-side-slide').click ->
    $(this).parents().find('.js-side-slid').addClass('is-side-slid')
  $('.js-rm-side-slide').click ->
    $(this).parents().find('.is-side-slid').removeClass('is-side-slid')

