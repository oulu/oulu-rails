$ ->
  $('.js-hover').hover (->
    $(this).addClass('is-hovered')
  ), ->
    $(this).removeClass('is-hovered')

$ ->
  $('.js-next-hover').hover (->
    $(this).next().addClass('is-hover')
  ), ->
    $(this).next().removeClass('is-hover')

$ ->
  $('.js-child-hover-show').hover (->
    $(this).find('.js-child-hover-show-target').removeClass('is-hidden')
  ), ->
    $(this).find('.js-child-hover-show-target').addClass('is-hidden')
