$ ->
  $('.js-hide').click ->
    $(this).parent().find('.js-hidden').addClass('is-hidden')
    $(this).parent().find('.js-hidden').removeClass('is-shown')
    $(this).addClass('is-hidden')
    $(this).next('.js-show').removeClass('is-hidden')
$ ->
  $('.js-show').click ->
    $(this).parent().find('.js-shown').addClass('is-shown')
    $(this).parent().find('.js-shown').removeClass('is-hidden')
    $(this).addClass('is-hidden')
    $(this).prev('.js-hide').removeClass('is-hidden')
$ ->
  $('.js-parent-close').click ->
    $(this).parent('.js-hidden').addClass('is-hidden')
    $(this).parent('.js-hidden').removeClass('is-shown')
    $(this).addClass('is-hidden')
