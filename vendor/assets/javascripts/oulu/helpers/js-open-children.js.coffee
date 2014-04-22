$ ->
  $(document).click ->
    $('.js-child').addClass("is-hidden")
    $('.js-child').removeClass("is-shown")
    return
  $('.js-show-child').click (ev) ->
    sub = $(this).children('.js-child')
    if $(this).is(".is-clicked")
      $(this).find(".is-shown").addClass("is-hidden")
      $(this).find(".is-shown").removeClass("is-shown")
    else
      $(this).parent().find(".is-shown").addClass("is-hidden")
      $(this).parent().find(".is-shown").removeClass("is-shown")
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



