# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script

EIP =
  _values : {}
  create: (key,value)->
    if @_values.hasOwnProperty(key)
      @_values[key]
    else
      @_values[key] = ko.observable(value)

  values: ->
    value() for key,value of @_values

  get: (key) ->
    @_values[key]

  set: (key,val) ->
    @_values[key](val)

window.EIP = EIP
