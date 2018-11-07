require 'spec_helper'

describe 'Die Class' do
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
