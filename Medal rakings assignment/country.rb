require_relative 'gdp.rb'

class Country
  include GDP
  attr_reader :country_name, :num_of_gold_medals, :num_of_silver_medals, :num_of_bronze_medals, :popualtion

  def initialize(country_name, num_of_gold_medals, num_of_silver_medals, num_of_bronze_medals, popualtion)
    @country_name = country_name
    @num_of_gold_medals = num_of_gold_medals
    @num_of_silver_medals = num_of_silver_medals
    @num_of_bronze_medals = num_of_bronze_medals
    @popualtion = popualtion
    @gdp = get_gdp(country_name)
  end

  def score
    score = (@num_of_gold_medals*3 + @num_of_silver_medals*2 + @num_of_bronze_medals) / @gdp
  end

  def to_s()
    ("#{@country_name}, #{@num_of_gold_medals}, #{@num_of_silver_medals}, #{@num_of_bronze_medals}, #{@popualtion}")
  end

end



