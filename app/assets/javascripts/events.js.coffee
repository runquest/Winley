# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# script for tabs 

$(document).ready ->
  $('.accordion-tabs').each ->
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show()
    return
  $('.accordion-tabs').on 'click', 'li > a', (event) ->
    if !$(this).hasClass('is-active')
      event.preventDefault()
      accordionTabs = $(this).closest('.accordion-tabs')
      accordionTabs.find('.is-open').removeClass('is-open').hide()
      $(this).next().toggleClass('is-open').toggle()
      accordionTabs.find('.is-active').removeClass 'is-active'
      $(this).addClass 'is-active'
    else
      event.preventDefault()
    return
  return

