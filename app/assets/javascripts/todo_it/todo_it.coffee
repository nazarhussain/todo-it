class window.Singleton
  @getInstance: ->
    @_instance ?= new @(arguments...)

class window.TodoIt extends Singleton
  constructor: ->
    console.log 'Initializing TodoIt...'
    @UI = new TodoIt.UI()