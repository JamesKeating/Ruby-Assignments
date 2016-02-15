require 'test/unit'
require_relative 'Card'


class CardTest < Test::Unit::TestCase

  def setup
    @random_card = Card.new
    @given_card = Card.new('Eight')
  end

  def test_random_card
    10.times{assert_includes(['Ace','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten','Jack','Queen','King'], Card.new.rank, 'Random card assigned invalid rank: not between 1-13')}
  end

  def test_given_card
    assert_equal('Eight', @given_card.rank,'Card assigned invalid rank: not equal to 1')
  end

  def test_to_s
    assert_equal('Eight', "#{@given_card}", 'Card rank coverted to invalid string')
  end

end