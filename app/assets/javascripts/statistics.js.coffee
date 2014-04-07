$(document).ready ->
  url = window.location.pathname
  question_id = url.substring(url.lastIndexOf("/") + 1)

  $('#morris-area-chart').html('Cargando...');
  request = $.ajax
    type: 'get',
    url: '/statistics/morris',
    data: 'question_id='+ question_id,
    dataType: 'json',
  request.done (data)->
    morris_area(data[0],'date_created_at', data[1]);
    bar(data[0],'date_created_at', data[1]);
    line(data[0],'date_created_at', data[1]);

  request = $.ajax
    type: 'get',
    url: '/statistics/donut',
    data: 'question_id='+ question_id,
    dataType: 'json',
  request.done (data)->
    donut(data);
