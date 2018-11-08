require 'spec_helper'

HARD_SET_VALUE = 2

describe 'Die Class' do
  context 'Pre-existing tests' do
    it "exists" do
      expect(Die).to be
    end

    it "responds to a reader called `max_pips`" do
      d = Die.new
      expect { d.max_pips }.not_to raise_error
    end

    it "is initialized, by default to have 6 pips" do
      d = Die.new
      expect(d.max_pips).to eq(6)
    end

    it "responds to a method called `roll`" do
      d = Die.new
      expect { d.roll }.not_to raise_error
    end
  end

  context 'New tests' do
    before(:each) do
      @d = Die.new(6,2)
    end

    it 'can be initialized with a hard-set value' do
      expect { Die.new(6, HARD_SET_VALUE)}.not_to raise_error
    end

    it 'has a #roll method that only returns the hard-set value' do
      test_set = Array.new(100){ @d.roll }
      expect(test_set.all?{ |i| i == HARD_SET_VALUE}).to be_truthy
    end
  end
end
