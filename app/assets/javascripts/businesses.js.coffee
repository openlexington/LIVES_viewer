# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  ctx = $("#chart").get(0).getContext("2d")
  $.get "/chart.json",
        id: $('#id').text()
      , (data) ->
        console.log(data)
        new Chart(ctx).Line(data, {scaleOverride: true, scaleSteps: 9, scaleStepWidth: 5, scaleStartValue: 60})