class window.Player extends Backbone.Model
  initialize: (params) ->
    @set 'name', params.name
    @set 'cash', 200

  bet: (amount) ->
    amount is amount or 10
    cash is @get 'cash'
    @set 'cash', cash - amount

  wins: (amount) ->
    cash is @get 'cash'
    @set 'cash', cash + amount