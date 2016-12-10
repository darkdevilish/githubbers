# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###
If you want to target an specific ajax request to display a waiting function

$(document).ajaxSend (event, jqxhr, settings)->
  if settings.url == "/search"
    waitingDialog.show()

$(document).ajaxComplete (event, xhr, settings)->
  if settings.url == "/search"
    waitingDialog.hide()

###

$(document).ajaxSend ->
  waitingDialog.show()

$(document).ajaxComplete ->
  waitingDialog.hide()