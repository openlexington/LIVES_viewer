# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

Window.setup_chart = ->
  if $("#chart")[0] != undefined
    if $("#chart").length != 0
      ctx = $("#chart").get(0).getContext("2d")
      $.get "/chart.json",
            id: parseInt($('#id').text())
          , (data) ->
            if data['labels'].length > 1
              new Chart(ctx).Line(data, {scaleOverride: true, scaleSteps: 9, scaleStepWidth: 5, scaleStartValue: 60})
              $("#chart").slideDown()

Window.setup_map = ->
  if $("#address")[0] != undefined
    geocoder = new google.maps.Geocoder()
    address = $("#address").text() + "Lexington, KY"



    mapOptions = {
      center: new google.maps.LatLng(38.035902,-84.506584),
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map($("#map").get(0), mapOptions)

    geocoder.geocode
      address: address
    , (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        map.setCenter results[0].geometry.location
        marker = new google.maps.Marker(
          map: map
          position: results[0].geometry.location
        )
      else
        $("#map").hide()

