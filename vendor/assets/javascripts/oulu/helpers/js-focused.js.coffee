$ ->
  $(".js-focused").bind "keydown keyup keypress change", ->
    thisValueLength = $(this).val().length
    if thisValueLength > 0
      $(this).addClass "is-focused"
    else
      $(this).removeClass "is-focused"