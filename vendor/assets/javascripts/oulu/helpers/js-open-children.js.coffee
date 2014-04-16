$ ->
  $('.js-open-child').click ->
      $(this).children('.js-child').toggleClass('is-hidden')
