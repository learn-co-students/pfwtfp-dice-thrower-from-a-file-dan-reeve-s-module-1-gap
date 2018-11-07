class Die
  # The number of dots on a die are called "pips"
  attr_reader :max_pips

  def initialize(max_pips=6)
    @max_pips = max_pips
  end

  def roll
    rand(max_pips) + 1
  end
end
