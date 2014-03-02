$ ->
  $(window).scroll ->
    headerHight = $('.header').height()
    heroHeight= $('.hero').height()
    postion = headerHight + heroHeight
    scrollY = $(this).scrollTop()
    if scrollY > postion
      $('.js-scroll-to-top').addClass('is-actived')
    else
      $('.js-scroll-to-top').removeClass('is-actived')

