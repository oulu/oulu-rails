$ ->
  $('.js-open-me').click ->
    $(this).toggleClass('is-closed')
    $(this).toggleClass('is-opend')

$ ->
  $('.js-open').click ->
    $(this).parents('.js-open-parent').find('.js-open-target').toggleClass('is-closed')
    $(this).parents('.js-open-parent').find('.js-open-target').toggleClass('is-opend')

$ ->
  $('.js-horizontal-open').click ->
    $(this).parents('.js-horizontal-open-parent').find('.js-horizontal-target').toggleClass('is-horizontal-closed')
    $(this).parents('.js-horizontal-open-parent').find('.js-horizontal-target').toggleClass('is-horizontal-opend')
    $(this).parents('.js-horizontal-open-parent').toggleClass('child-is-opend')
    $(this).parents('.js-horizontal-open-parent').toggleClass('child-is-closed')

