class window.AppView extends Backbone.View
  className: 'table'
  template: _.template $('#app-template').html()

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.endGame()

  initialize: ->
    @render()
    this.model.on 'change:winner', =>
      console.log 'winner', this.model.get 'winner'
      #@render()
      @removeButtons()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  removeButtons: ->
    $ ->
      $('button').attr('disabled', true)
      $('#startNewGame').attr('disabled', false).delay(1000).fadeIn(300)