$ ->
  $(document).click ->
    $('.js-child').addClass("is-hidden")
    $('.js-child').removeClass("is-shown")
    return
  $('.js-show-child').click (ev) ->
    sub = $(this).children('.js-child')
    if $(sub).is(".is-hidden")
      ev.stopPropagation()
      $(sub).removeClass("is-hidden")
      $(sub).addClass("is-shown")
    else
      ev.stopPropagation()
      $(sub).removeClass("is-shown")
      $(sub).addClass("is-hidden")
    $(this).parent().find('.is-clicked').removeClass("is-clicked")
    $(this).addClass('is-clicked')

  $("body").on "click", ".is-clicked", ->
    $(this).find('.js-child').addClass("is-hidden")
    $(this).find('.js-child').removeClass("is-shown")