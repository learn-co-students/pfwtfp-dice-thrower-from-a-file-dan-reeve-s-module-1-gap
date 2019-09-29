class DiceRoller
  attr_reader :dice_count, :dice

  def initialize(dice_count = 1, pips_count=6, preset=[])
    @dice_count = dice_count
    @pips_count = pips_count

    @dice = preset.empty? ?
      Array.new(@dice_count) { Die.new(@pips_count) } :
      preset.map{ |hard_val| Die.new(@pips_count, hard_val) }
  end

  def generate_set
    dice.map{ |d| d.roll }
  end

  def lucky?
    total = 0
    dice.each do |die|
      total += die.roll
    end
    return total == 7
  end
end
