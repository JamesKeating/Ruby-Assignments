require_relative 'Card'

class Hand

  def initialize
    @hand = Array.new
  end

  def add_card(card)
    if !complete?
      @hand << (card)
    end
  end

  def complete?
    hand_size == @max_hand_size
  end

  def contains?(card)
    @hand.each do |card_in_hand|
      if card_in_hand.rank == card.rank
        return true
      end
    end
    false
  end

  def value(card)
    @card_values[card.rank]
  end

  def evaluate
    if complete?
      values = Array.new
      @hand.each() do |card_in_hand|
        values << value(card_in_hand)
      end

    else
       return nil
    end

    values = values.sort
    ((values.first + values.last).to_f/hand_size.to_f)
  end

  def fill_hand_with_rand_cards
    while !complete?
      card = Card.new
      if !contains?(card) #duplicates not allowed
        add_card(card)
      end
    end
  end

  def hand_size
    @hand.size
  end

  def to_s
    hand = ''
    @hand.each do |card|
      hand << card.rank
      hand << ','
    end

    hand
  end

end

class TwoCardGame < Hand
  def initialize
    super
    @max_hand_size = 2
  end
end

class FiveCardGame < Hand
  def initialize
    super
    @max_hand_size = 5
  end
end

class Idiot < TwoCardGame
  def initialize
    super
    @card_values = {
        "Ace"=>1,"Two"=>2,"Three"=>3,"Four"=>4,"Five"=>5,"Six"=>6,"Seven"=>7,
        "Eight"=>8,"Nine"=>9,"Ten"=>10,"Jack"=>11,"Queen"=>12,"King"=>13
    }
  end
end

class Liar < TwoCardGame
  def initialize
    super
    @card_values = {
        "Ace"=>13,"Two"=>12,"Three"=>11,"Four"=>10,"Five"=>9,"Six"=>8,"Seven"=>7,
        "Eight"=>6,"Nine"=>5,"Ten"=>4,"Jack"=>3,"Queen"=>2,"King"=>1
    }
  end

end

class Light < FiveCardGame
  def initialize
    super
    @card_values = {
        "Ace"=>1,"Two"=>13,"Three"=>12,"Four"=>4,"Five"=>3,"Six"=>10,"Seven"=>9,
        "Eight"=>2,"Nine"=>7,"Ten"=>11,"Jack"=>5,"Queen"=>8,"King"=>6
    }
  end

end

class Spider < FiveCardGame
  def initialize
    super
    @card_values = {
        "Ace"=>0,"Two"=>0,"Three"=>0,"Four"=>0,"Five"=>0,"Six"=>0,"Seven"=>0,
        "Eight"=>0,"Nine"=>0,"Ten"=>0,"Jack"=>3,"Queen"=>2,"King"=>1
    }
  end

  def evaluate
    if complete?
      values = Array.new
      @hand.each() do |card_in_hand|
        values << value(card_in_hand)
      end

    else
      return nil
    end

    values.sort[2]
  end

end
