class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src=<%= image %> />'

  initialize: ->
    @render()

  render: ->
    @$el.children().detach().end().html
    if @model.get 'revealed'
      @$el.html @template @model.attributes
    else
      @$el.html
    @$el.addClass 'covered' unless @model.get 'revealed'
