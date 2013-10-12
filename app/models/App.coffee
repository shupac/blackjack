#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    if @get('playerHand').getScore() is 21
      console.log 'blackjack'
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
        # console.log 'player wins'
      else if playerScore < @get('dealerHand').getScore()
        @set 'winner', 'dealer'
        # console.log 'dealer wins'
      else
        @set 'winner', 'tie'
        # console.log 'tie'