require 'spec_helper'

describe 'DiceRoller' do
  context "Legacy Tests" do
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

  context "New Tests" do
    before(:each) do
      @dr1 = DiceRoller.new(2, 6, [2,3])
      @dr_lucky = DiceRoller.new(2, 6, [3,4])
    end

    it 'can be initialized with a an Array of Die' do
      expect { DiceRoller.new(6, HARD_SET_VALUE, [1, 1])}.not_to raise_error
    end

    it 'has a generate_set method that honors hard-coded values for Die that it manages' do
      dice_values = @dr1.generate_set
      expect(dice_values).to eq([2,3])
    end

    it 'has a #lucky? method that says a Die with a hard set values totalling 5 was not lucky' do
      expect(@dr1.lucky?).to be_falsy
    end

    it 'has a #lucky? method that says a Die with a hard set values totalling 7 was lucky' do
      expect(@dr_lucky.lucky?).to be_truthy
    end
  end
end
