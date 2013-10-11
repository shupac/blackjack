#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  endGame: ->
    @get('dealerHand').revealHand()
    dealerScore = @get('dealerHand').scores()[0]
    playerScore = @get('playerHand').scores()[0]
    console.log dealerScore, playerScore
    if dealerScore > playerScore
      @set 'winner', 'dealer'
    else
      @set 'winner', 'player'
    console.log @get 'winner'