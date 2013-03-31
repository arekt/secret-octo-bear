# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  class FormBuilder
    constructor : (form_tag)->
      @token = $(form_tag).data("authenticity-token")
      @model = ko.mapping.fromJS($(form_tag).data("model"))
      @raw_data = $(form_tag).data("model")
      console.log $(form_tag).data("model")
      console.log @model
      @submit = (object)=>
        console.log "Sending:"
        console.log object
        $.ajax
          type: "POST"
          url: "/forms"
          data: {person: ko.mapping.toJS(object.data), authenticity_token: @token}
          success: (data) =>
            console.log data
            ko.mapping.fromJS(data, @model);
            return false
          error: ->
            console.log "error"

      @textField = (root, model_name) ->
        data = root.data[model_name]
        errors = ko.observableArray([])
        if root.data.errors
          for error in root.data.errors()
            for k,v of error
              errors().push v if k == model_name
        node = {v: data, errors: errors, label: model_name, name: model_name }
        root[model_name] = node
        return node

      @section = (root, model_name, data) ->
        console.log "Section was called"
        node = {name: model_name, data : data }
        root[model_name] = node
        return node

      @form =  =>
        {data:  @model }
      @messages = [ {title: "hello", body: "asdfasdf"}]

  $(".form_container form").each (index,form)->
    console.log form
    window.fb = new FormBuilder(form)
    ko.applyBindings(fb, form);
