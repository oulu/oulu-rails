$ ->
  $('.js-open-child').click ->
      $(this).parent().find('.js-child').addClass('is-hidden')
      $(this).children('.js-child').toggleClass('is-hidden')
