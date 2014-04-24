$ ->
  $(".js-show-child").click ->
    if $(this).hasClass("selected")
      
      # メニュー非表示
      $(this).removeClass("selected")
      $(this).find(".is-shown").addClass('is-hidden')
      $(this).find(".is-shown").removeClass('is-shown')
    else
      
      # 表示しているメニューを閉じる
      $(".js-show-child").removeClass "selected"
      $(".js-show-child ul").addClass('is-hidden')
      $(".js-show-child ul").removeClass('is-shown')
      
      # メニュー表示
      $(this).addClass("selected").find("ul").addClass('is-shown')
      $(this).addClass("selected").find("ul").removeClass('is-hidden')
  
  # メニュー外でクリックすると閉じる
  $(".js-show-child").hover (->
    $("body").addClass('js-keep-child')
    ), ->
      $("body").removeClass('js-keep-child')
  $("body").click ->
    if not $("body").hasClass("js-keep-child")
      $(".js-child").addClass('is-hidden') 
      $(".js-child").removeClass('is-shown') 
