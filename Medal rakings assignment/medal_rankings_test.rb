require 'test/unit'

require_relative 'Medal_Rankings'

class MedalRankingsTest < Test::Unit::TestCase

  def setup
    @medal_rankings = MedalRankings.new
  end

  def test_to_s
    ireland = Country.new('IRL', 1, 1, 3, 4475000)
    spain = Country.new('ESP', 2, 3, 4, 9875000)
    @medal_rankings.add_country(ireland)
    @medal_rankings.add_country(spain)

    assert_equal('',@medal_rankings.to_s(0),'Incorrect string returned')
    assert_equal("IRL, 1, 1, 3, 4475000\n", @medal_rankings.to_s(1),'Incorrect string returned')
    assert_equal("IRL, 1, 1, 3, 4475000\nESP, 2, 3, 4, 9875000\n", @medal_rankings.to_s(2),'Incorrect string returned')
  end

  def test_add_country
    ireland = Country.new('IRL', 1, 1, 3, 4475000)

    assert_equal("", @medal_rankings.to_s, "country there before added")
    @medal_rankings.add_country(ireland)
    assert_equal("IRL, 1, 1, 3, 4475000\n", @medal_rankings.to_s, "country not added")
  end

  def test_most_gold
    @medal_rankings.add_countries_from_file('medals.txt')
    assert_equal('USA, 46, 29, 29, 309349000', @medal_rankings.most_golds.to_s, 'incorrect country returned')
  end

  def test_average_population
    @medal_rankings.add_countries_from_file('medals.txt')
    assert_equal(33778365, @medal_rankings.average_population, 'incorrect population returned')
  end

  def test_sort!
    @medal_rankings.add_countries_from_file('medals.txt')

    assert_fail_assertion{assert_equal("GRD, 1, 0, 0, 104000\nJAM, 4, 4, 4, 2702000\nPRK, 4, 0, 2, 24589122\n",@medal_rankings.to_s(3),"incorrect order for countries")}
    @medal_rankings.sort!
    assert_equal("GRD, 1, 0, 0, 104000\nJAM, 4, 4, 4, 2702000\nPRK, 4, 0, 2, 24589122\n",@medal_rankings.to_s(3),"incorrect order for countries")
  end

  def test_each_single_gold_winner
    @medal_rankings.add_countries_from_file('medals.txt')
    array = Array.new
    @medal_rankings.each_single_gold_winner{|country| array << country}

    assert_equal('DZA, 1, 0, 0, 35468000',array[0].to_s,"incorrect single gold winners")
    assert_equal('BHS, 1, 0, 0, 343000',array[1].to_s,"incorrect single gold winners")
  end

  def test_add_countries_from_file
    @medal_rankings.add_countries_from_file('medals.txt')
    first_5_countries = "AFG, 0, 0, 1, 34385000\nALB, 0, 0, 0, 3205000\nDZA, 1, 0, 0, 35468000\nASM, 0, 0, 0, 68420\nAND, 0, 0, 0, 84864\n"
    assert_equal(first_5_countries,@medal_rankings.to_s(5),'incorrect countries read from file')
  end

end