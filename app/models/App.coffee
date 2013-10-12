#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # not firing to view, as view is not available yet
    if @get('playerHand').getScore() is 21
      @set 'winner', 'player'
      @endGame()

    @get('playerHand').on 'bust', =>
      @get('dealerHand').revealHand()
      @set 'winner', 'dealer'
    @get('dealerHand').on 'bust', =>
      @set 'winner', 'player'

    @get('playerHand').on 'natural', =>
      @endGame()

  endGame: ->
    @get('dealerHand').revealHand()
    playerScore = @get('playerHand').getScore()

    while @get('dealerHand').getScore() < 17
      @get('dealerHand').hit()

    if @get('dealerHand').getScore() < 21
      if playerScore > @get('dealerHand').getScore()
        @set 'winner', 'player'
      else if playerScore < @get('dealerHand').getScore()
        @set 'winner', 'dealer'
      else
        @set 'winner', 'tie'
