class DiceRoller
  attr_reader :dice_count, :dice

  def initialize(dice_count = 1, pips_count=6)
    @dice_count = dice_count
    @pips_count = pips_count

    @dice = Array.new(@dice_count) { Die.new(@pips_count) }
  end

  def generate_set
    @dice.map{ |d| d.roll }
  end
end
