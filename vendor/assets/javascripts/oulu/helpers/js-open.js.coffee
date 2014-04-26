
$ ->
  $('.js-open-me').click ->
    $(this).toggleClass('is-closed')
    $(this).toggleClass('is-opend')

$ ->
  $('.js-open').click ->
    $(this).parents('.js-open-parent').find('.js-open-target').toggleClass('is-closed')
    $(this).parents('.js-open-parent').find('.js-open-target').toggleClass('is-opend')
