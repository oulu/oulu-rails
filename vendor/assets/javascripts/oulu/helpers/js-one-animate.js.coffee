$ ->
  $('.js-one-animate').bind "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", ->
    $(this).removeClass('animated')
  $('.js-one-animate').bind "animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", ->
    $(this).removeClass('animated')
