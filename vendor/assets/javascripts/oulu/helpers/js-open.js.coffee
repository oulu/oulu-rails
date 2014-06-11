$ ->
  $('.js-open-me').click ->
    $(this).toggleClass('is-closed')
    $(this).toggleClass('is-opend')

$ ->
  $('.js-open').click ->
    $(this).parents('.js-open-parent').find('.js-open-target').toggleClass('is-closed')
    $(this).parents('.js-open-parent').find('.js-open-target').toggleClass('is-opend')

$ ->
  $('.js-open-parent').click ->
    $(this).parent('.js-open-parent-target').toggleClass('is-closed')
    $(this).parent('.js-open-parent-target').toggleClass('is-opend')

$ ->
  $('.js-open-parents').click ->
    $(this).parents('.js-open-parents-target').toggleClass('is-closed')
    $(this).parents('.js-open-parents-target').toggleClass('is-opend')

$ ->
  $('.js-open-prev').click ->
    $(this).prev().toggleClass('is-closed')
    $(this).prev().toggleClass('is-opend')

$ ->
  $('.js-open-prevAll').click ->
    $(this).prevAll('.js-open-prevAll-target').toggleClass('is-closed')
    $(this).prevAll('.js-open-prevAll-target').toggleClass('is-opend')

$ ->
  $('.js-open-closest').click ->
    $(this).closest('.js-open-closest-target').toggleClass('is-closed')
    $(this).closest('.js-open-closest-target').toggleClass('is-opend')

$ ->
  $('.js-open-closest').click ->
    $(this).closest('.js-open-closest-target').toggleClass('is-closed')
    $(this).closest('.js-open-closest-target').toggleClass('is-opend')

$ ->
  $('.js-open-target').click ->
    $('.js-open-target-target').toggleClass('is-closed')
    $('.js-open-target-target').toggleClass('is-opend')

$ ->
  $('.js-horizontal-open').click ->
    $(this).parents('.js-horizontal-open-parent').find('.js-horizontal-target').toggleClass('is-closed')
    $(this).parents('.js-horizontal-open-parent').find('.js-horizontal-target').toggleClass('is-opend')
    $(this).parents('.js-horizontal-open-parent').toggleClass('child-is-opend')
    $(this).parents('.js-horizontal-open-parent').toggleClass('child-is-closed')
