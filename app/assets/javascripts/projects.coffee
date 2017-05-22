$(document).ready ->
  $('.tabs a').on 'click', (e) ->
    e.preventDefault()
    sectionId = $(this).attr('href')
    $(this).addClass('current').parent().siblings().find('a').removeClass 'current'
    $(sectionId).fadeIn().siblings().fadeOut()
    return
  $('.tabs a.current').first().click()
  return

  $('#new-character').on 'click', (e) ->
    e.preventDefault()
