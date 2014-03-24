$(document).ready ->
  rad = $(".new_answer input[type=radio]")
  prev = null
  i = 0

  while i < rad.length
    rad[i].onclick = ->
      $("#new_answer").submit()
      return
    i++
