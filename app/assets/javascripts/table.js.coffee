# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class Todo
  constructor: (title) ->
    @title = title;
    @completed = ko.observable(false)
    @className = ko.computed ->
      if @completed()
        'completed'
      else
        null
    , @
window.Todo = Todo
# window.Todos = ->
#   @todos = ko.observableArray([]);
#   @todoToAdd = ko.observable('');
#   @addTodo = ->
#     @todos.push new Todo(@todoToAdd());
#     @todoToAdd('');

#   @allowClear = ko.computed ->
#       if @todos().length
#         return @todos().every (todo) ->
#           return todo.completed();
#     , @
#   @clearList = ->
#     @todos([]);

