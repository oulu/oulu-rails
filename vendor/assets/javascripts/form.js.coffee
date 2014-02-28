$ ->
  # チェックボックス、ラジオボタンにチェックを入れたら、親要素のlabel に .checked を付ける
  $(":checked").parents("label").addClass "checked"
  $("input").click (e) ->
    t = e.target.type
    chk = $(this).prop("checked")
    name = $(this).attr("name")
    if t is "checkbox"
      if chk is true
        $(this).parents("label").addClass "checked"
      else
        $(this).parents("label").removeClass "checked"
      true
    else if t is "radio"
      if chk is true
        $(this).parents('ul').each ->
          $(this).find('label').removeClass "checked"
        $('input[name=" + name + "]').parents("ul label").removeClass "checked"
        $(this).parents('label').addClass "checked"
      true

  # すでにチェックが入ってるものにページ読み込みの時点で .checked を付ける
  $(this).find(":checked").closest("label").addClass "checked"

  # ラジオボタンの親要素をクリッカブルに .clickable も付ける
  cf = $(':radio').parent()
  cf.addClass('clickable')
  cf.click ->
    $(this).find(':radio').attr('checked', true)

  rl = $(':radio').parents("label")
  cl = $(':checkbox').parents("label")
  rl.addClass 'radio-label'
  cl.addClass 'checkbox-label'
