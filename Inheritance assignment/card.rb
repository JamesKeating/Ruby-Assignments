class Card

  attr_reader :rank

  #if no argument is passed a random card rank is selsected
  def initialize(rank = nil)

    rank_hash = {
        1=>"Ace", 2=>"Two",3=>"Three",4=>"Four",5=>"Five",6=>"Six",7=>"Seven",
        8=>"Eight",9=>"Nine", 10=>"Ten",11=>"Jack",12=>"Queen",13=>"King"
    }
    rank = rank_hash[rand(1..13)] if rank.nil?

    @rank = rank

  end

  def to_s
    @rank
  end

end
