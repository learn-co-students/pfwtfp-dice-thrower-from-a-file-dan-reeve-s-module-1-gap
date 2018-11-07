require 'spec_helper'

describe 'DieRoller' do
  it "exists" do
    expect(DiceRoller).to be
  end

  it "is initialized with no arguments to have a single, regular, die"  do
    dr = DiceRoller.new
    expect(dr.dice.length).to eq(1)
  end

  it "is initialized with die count of 2, has 2 die"  do
    dr = DiceRoller.new(2)
    expect(dr.dice.length).to eq(2)
  end

  it "is initialized with die count of 2, with pips set to 4 sums to 8"  do
    dr = DiceRoller.new(2, 4)
    expect(dr.dice.map(&:max_pips).reduce(&:+)).to eq(8)
  end

  context "#generate_set" do
    it "generates an `Array` of n-many rolled Die" do
      dr = DiceRoller.new(2)
      die_set = dr.generate_set
      expect(die_set.length).to eq(2)
    end
  end
end
