new AppView(model: new App()).$el.appendTo 'body'

$ ->
  $('#startNewGame').on('click', ->
    $('body').html("")
    new AppView(model: new App()).$el.appendTo 'body')