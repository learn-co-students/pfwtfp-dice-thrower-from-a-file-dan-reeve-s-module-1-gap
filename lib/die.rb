class Die
  # The number of dots on a die are called "pips"
  attr_reader :max_pips

  def initialize(max_pips=6, set_value=nil)
    @max_pips = max_pips
    @set_value = set_value
  end

  def roll
    @set_value ? @set_value : rand(max_pips) + 1
  end

  def random_roll?
    !@set_value
  end
end
