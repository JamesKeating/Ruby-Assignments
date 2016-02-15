require_relative'Country.rb'

class MedalRankings

  def initialize
    @countries = Array.new
  end

  def add_country(country)
    @countries << country
  end

  def most_golds
    abort('Error: No countries in medal rankings') if @countries.empty?

    most_gold_country =  @countries[0]
    @countries.each do |country|
      if country.num_of_gold_medals > most_gold_country.num_of_gold_medals
         most_gold_country = country
      end
    end

    most_gold_country
  end

  def average_population
    abort('Error, program Aborted: No countries in medal rankings') if @countries.empty?

    total_pop = 0
    @countries.each do |country|
      total_pop += country.popualtion
    end

    total_pop / @countries.size
  end

  def sort!
    @countries.sort_by!{ |country| country.score}.reverse!
  end

  def each_single_gold_winner
    @countries.each do |country|
      if  country.num_of_gold_medals == 1 &&
          country.num_of_silver_medals == 0 &&
          country.num_of_bronze_medals == 0

        yield(country)
      end
    end
  end

  def add_countries_from_file(filename)
    abort("Error, program Aborted: File #{filename} does not exsist") unless File.exist?(filename)

    countries_from_file = Array[*File.read(filename).split(/\n/)]

    countries_from_file.each do |country|
      country_info = [*country.split(/ /)]
      country_from_file = Country.new(country_info[0], country_info[1].to_i, country_info[2].to_i, country_info[3].to_i, country_info[4].to_i)
      add_country(country_from_file)
    end
  end


  def to_s(n = @countries.size)
    string = ''
    if n <= @countries.size
      0.upto(n-1) do |i|
        string += "#{@countries[i]}\n"
      end

    else
      abort("Error, program Aborted: Cannont display first #{n} countries medal rankings, as there are only #{@countries.size} countries stored")
    end

    string
  end

end

