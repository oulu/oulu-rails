$ ->
  $(".js-checkbox").click ->
    if $(".js-checkbox input").is(":checked")
      $(this).addClass('is-checked')
    else
      $(this).removeClass('is-checked')
