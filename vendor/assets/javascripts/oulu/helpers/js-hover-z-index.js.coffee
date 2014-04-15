$ ->
  $('.js-hover-z-index-100').hover ->
      $(this).addClass('is-z-index-100')
    , ->
      $(this).removeClass('is-z-index-100')
