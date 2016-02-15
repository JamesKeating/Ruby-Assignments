require 'test/unit'
require_relative 'Hand'


class HandTest < Test::Unit::TestCase

  def setup
    @idiot_hand = Idiot.new
    @liar_hand = Liar.new
    @light_hand = Light.new
    @spider_hand = Spider.new
  end

  def test_add_card
    jack_card = Card.new('Jack')
    ace_card = Card.new('Ace')

    assert_equal(0,@idiot_hand.hand_size, 'hand is not empty when created')
    assert_equal(false,@idiot_hand.contains?(jack_card), 'Hand contains card it should not')
    @idiot_hand.add_card(jack_card)
    assert_equal(1,@idiot_hand.hand_size, '1 card wsa not added to hand')
    assert_equal(true, @idiot_hand.contains?(jack_card), 'Jack has not been added to the hand')

    @idiot_hand.add_card(ace_card)
    assert_equal(2,@idiot_hand.hand_size, 'hand is not full')
    @idiot_hand.add_card(jack_card)
    assert_equal(2,@idiot_hand.hand_size, 'card was added When hand was full')

  end

  def test_complete?
    assert_equal(false, @liar_hand.complete?, 'Complete returned true when hand was not complete')
    @liar_hand.fill_hand_with_rand_cards
    assert_equal(2, @liar_hand.hand_size, 'hand has bit been filled')
    assert_equal(true, @liar_hand.complete?, 'complete? did not return true for full hand')

    assert_equal(false, @light_hand.complete?, 'Complete returned true when hand was not complete')
    @light_hand.fill_hand_with_rand_cards
    assert_equal(5, @light_hand.hand_size, 'hand has bit been filled')
    assert_equal(true, @light_hand.complete?, 'complete? did not return true for full hand')
  end

  def test_contains?
    king_card = Card.new('King')
    assert_equal(false,@idiot_hand.contains?(king_card), 'Contains is true when card is not in hand')
    @idiot_hand.add_card(king_card)
    assert_equal(true, @idiot_hand.contains?(king_card), 'Contains is false when card is in hand')
  end

  def test_value
    ace_card = Card.new('Ace')
    assert_equal(1, @idiot_hand.value(ace_card), 'Incorrect value for idiot hand')
    assert_equal(13, @liar_hand.value(ace_card), 'Incorrect value for liar hand')
    assert_equal(1, @light_hand.value(ace_card), 'Incorrect value for light hand')
    assert_equal(0, @spider_hand.value(ace_card), 'Incorrect value for spider hand')
  end

  def test_evaluate
    assert_equal(nil,@idiot_hand.evaluate, 'did not return nil evaluating non complete hand')

    @idiot_hand.add_card(Card.new('Ace'))
    @idiot_hand.add_card(Card.new('Jack'))
    assert_equal(6,@idiot_hand.evaluate, 'incorrect score for idiot hand')

    @spider_hand.add_card(Card.new('Ace'))
    @spider_hand.add_card(Card.new('Two'))
    @spider_hand.add_card(Card.new('Jack'))
    @spider_hand.add_card(Card.new('Queen'))
    @spider_hand.add_card(Card.new('King'))
    assert_equal(1,@spider_hand.evaluate, 'incorrect score for spider hand')

    @light_hand.add_card(Card.new('Ace'))
    @light_hand.add_card(Card.new('Two'))
    @light_hand.add_card(Card.new('Jack'))
    @light_hand.add_card(Card.new('Queen'))
    @light_hand.add_card(Card.new('King'))
    assert_equal(2.8,@light_hand.evaluate, 'incorrect score for light hand')
  end

  def test_fill_hand_with_rand_cards
    assert_equal(false, @idiot_hand.complete?, 'hand is full before it should be')
    @idiot_hand.fill_hand_with_rand_cards
    assert_equal(true, @idiot_hand.complete?, 'hand has not been filled')

    assert_equal(false, @light_hand.complete?, 'hand is full before it should be')
    @light_hand.fill_hand_with_rand_cards
    assert_equal(true, @light_hand.complete?, 'hand has not been filled')
  end

  def test_to_string
    @idiot_hand.add_card(Card.new('Ace'))
    @idiot_hand.add_card(Card.new('Two'))
    assert_equal("Ace,Two,","#{@idiot_hand}", "not correct string")
  end


end