$ ->
  $('.js-click-animate').click ->
    add = $(this).data('click')
    added = 'is-' + add
    $(this).addClass(added)
    $(this).bind("animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd", ->
      $(this).removeClass added
    )
