require 'test/unit'
require_relative 'base_game.rb'

class TestQuorumCard < Test::Unit::TestCase
  def test_has_actions
    deck = QuorumDeck.new
    while deck.cards_remaining > 0
      card = deck.draw
      assert_equal(true, card.has_action?)
    end
  end
end
