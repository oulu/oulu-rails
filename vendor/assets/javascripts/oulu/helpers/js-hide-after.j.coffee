$ ->
  time = $(".js-hide-after").data("time")
  setTimeout (->
    $(".js-hide-after").addClass('is-fadeout')
  ), time
