$ ->
  $('.js-close').click ->
    $(this).parent().find('.js-close').addClass('is-closed')
    $(this).parent().find('.js-close').removeClass('is-opend')
    $(this).addClass('is-closed')
    $(this).next('.js-show').removeClass('is-closed')
$ ->
  $('.js-open').click ->
    $(this).parent().find('.js-shown').addClass('is-opend')
    $(this).parent().find('.js-shown').removeClass('is-closed')
    $(this).addClass('is-closed')
    $(this).prev('.js-close').removeClass('is-closed')
