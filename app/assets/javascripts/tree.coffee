$(document).on 'click contextmenu', '*[data-toggle="tree"]', (event) ->
  button = $(this)
  item = button.closest('.item')
  $.collapse(item, !item.hasClass('collapsed'), event.type == 'contextmenu')
  return false

$.collapse = (item, collapse, deep = false) ->
  if collapse
    item.addClass('collapsed')
  else
    item.removeClass('collapsed')
  list = item.find('> ul.item-list')
  if collapse
    list.slideUp()
  else
    list.slideDown()
  if deep
    list.find('> li.item').each ->
      $.collapse($(this), collapse, true)
  
