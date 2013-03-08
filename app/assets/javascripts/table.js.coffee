# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class Todo
  constructor: (@title) ->
    @completed = ko.observable(false)
    @className = ko.computed =>
      if @completed()
        'completed'
      else
        null

class Todos
  constructor: (todos_array=[])->
    @todos = ko.observableArray(todos_array);
    @todoToAdd = ko.observable('');
    @todoToAdd('');
    @allowClear = ko.computed =>
      if @todos().length > 5
        return true
      else
        false


  addTodoHandler : ->
    @todos.push new Todo(@todoToAdd());

  addTodo : (todo)->
    @todos.push new Todo(todo);


  clearList: ->
    @todos([]);

window.Todo = Todo
window.Todos = Todos
