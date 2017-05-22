$(document).ready ->
  $('.tabs a').on 'click', (e) ->
    e.preventDefault()
    sectionId = $(this).attr('href')
    $(this).addClass('current').parent().siblings().find('a').removeClass 'current'
    $(sectionId).fadeIn().siblings().fadeOut()
    return

  $('.tabs a.current').first().click()

  $('.accordion a').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass('show').parent().siblings().find('a').removeClass 'show'
    return

  $('.accordion li:first-child a').click()
