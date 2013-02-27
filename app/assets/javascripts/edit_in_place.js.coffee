# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script

EIP =
  _values : {}
  create: (key,value)->
    return key if @_values[key]
    console.log "Saving value"
    @_values[key] = ko.observable(value)
    value
  values: ->
    console.log @_values

  find: (key) ->
    @_values[key]?() || "not set yet"

window.EIP = EIP
