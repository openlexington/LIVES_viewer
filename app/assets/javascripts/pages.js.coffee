# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#search").typeahead
    minLength: 3
    source: (query, process) ->
      $.get "/autocomplete_business_name.json",
        query: query
      , (data) ->
        process data
