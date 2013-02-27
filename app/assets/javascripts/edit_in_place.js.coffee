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
  edit : ->
    @state("editing")

window.EIP = EIP
