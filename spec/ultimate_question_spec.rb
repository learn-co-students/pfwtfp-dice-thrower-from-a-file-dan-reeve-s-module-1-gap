require 'spec_helper'

describe 'LuckAnalyzer' do
  context 'tells us who the luckiest candidate is' do
    it "correctly identifies Byron as the luckiest with ~58% lucky" do
      la = LuckAnalyzer.new("trials.csv")
      expect(la.luckiest).to eq("Byron (58)")
    end
  end
end
