$ ->
  $('.js-hovered').hover (->
    $(this).addClass('is-hover')
  ), ->
    $(this).removeClass('is-hover')

$ ->
  $('.js-next-hover').hover (->
    $(this).next().addClass('is-hover')
  ), ->
    $(this).next().removeClass('is-hover')
