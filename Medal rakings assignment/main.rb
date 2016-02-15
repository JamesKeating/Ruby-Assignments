require_relative'medal_rankings'
require_relative 'country'

class Main

  #setup
  medal_rankings = MedalRankings.new
  medal_rankings.add_countries_from_file('medals.txt')

  #part 1
  puts "\nPart 1: 'There's no main.rb file for this part.'"

  #part 2
  puts "\nPart 2: 'Output details of one of the countries that won the most gold medals, and the average population of all the countries.'"
  puts "Most Golds: #{medal_rankings.most_golds}\n"
  puts "Average Population: #{medal_rankings.average_population}\n"

  #part 3
  puts "\nPart 3: 'Invoke sort! in main.rb, then use to_s(n) to print the first 10 countries in MedalRankings.'"
  medal_rankings.sort!
  puts medal_rankings.to_s(10)

  #part 4
  puts "\nPart 4: 'Use the each_single_gold_winner() iterator in main.rb,\nto print out the countries that won exactly one gold medal and none other,\nin alphabetical order.' "
  all_single_gold_winners = Array.new
  medal_rankings.each_single_gold_winner{|country| all_single_gold_winners << country}
  all_single_gold_winners.sort_by!{|country| country.country_name}
  puts all_single_gold_winners

end