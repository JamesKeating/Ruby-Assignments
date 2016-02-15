require 'test/unit'
require_relative 'Country'


class CountryTest < Test::Unit::TestCase

  def setup
    @ireland = Country.new('IRL', 1, 1, 3, 4475000)
  end

  def test_to_s
    assert_equal('IRL, 1, 1, 3, 4475000',"#{@ireland}", 'Incorrect string returned')
  end

  def test_score
    assert_equal(3.681969853871822e-11,@ireland.score, 'Incorrect score returned')
  end

end