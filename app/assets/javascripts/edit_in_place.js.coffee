# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script

EIP =
  firstName : ko.observable("Arek")
  firstNameEdit : ko.observable("Arek")
  state : ko.observable("showing")
  save : ->
    @state("showing")
    @firstName(@firstNameEdit())
  reset : ->
    @state("showing")
    @firstNameEdit(@firstName())
  edit : ->
    @state("editing")

window.EIP = EIP

window.BIP =
  bips : ko.observableArray(["aa","bb"])

ko.bindingHandlers.bip =
  init: (element, valueAccessor, allBindingsAccessor) ->
    ko.bindingHandlers['value']["init"](element, valueAccessor, allBindingsAccessor)
  update: (element, valueAccessor, allBindingsAccessor) ->
    console.log "update fired:"+ valueAccessor()
    element.value = valueAccessor()[0]
