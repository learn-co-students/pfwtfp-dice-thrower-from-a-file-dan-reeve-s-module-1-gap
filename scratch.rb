#!/usr/bin/env ruby -r byebug

require 'csv'
require 'pp'
require 'byebug'

class DiceRoller
  def self.new_with_dice(dice)
    new(dice.length, dice.first.max_pips, dice)
  end

  attr_reader :dice_count, :dice

  def initialize(dice_count = 1, pips_count=6, given=[])
    @dice_count = dice_count
    @pips_count = pips_count

    @dice = given.empty? ? Array.new(@dice_count) { Die.new(@pips_count) } : given
  end

  def generate_set
    @dice.map{ |d| d.roll }
  end

  def lucky?
    @dice.map(&:roll).reduce(&:+) == 7
  end
end


class Die
  def self.new_with_value(max_pips, hard_set_value)
    new(max_pips, hard_set_value)
  end

  # The number of dots on a die are called "pips"
  attr_reader :max_pips, :hard_set_value

  def initialize(max_pips=6, hard_set_value = nil)
    @max_pips = max_pips.to_i
    @hard_set_value = hard_set_value
  end

  def roll
    @hard_set_value || rand(max_pips) + 1
  end
end

class LuckAnalyzer
  attr_reader :csv_data

  def initialize(file_name)
    begin
      @csv_data = CSV.read(File.join(File.dirname(__FILE__),  file_name))
    rescue => e
      STDERR.puts e.message
    end
  end

  def lucky_order
    person_to_lucky_percentage
      .sort { |j, k| k[1] <=> j[1] }
      .map{|j| j.first}
  end

  def luckiest
    person_to_lucky_percentage.max_by{|k| k[1]}.first
  end

  def common_number_of_trials
    name_to_counts.min_by { |e| e[1] }.last
  end

  def name_to_counts
    @csv_data.reduce(Hash.new{ |h, k| h[k] = 0}) do |memo, r|
      person_name = r[1]
      memo[person_name] += 1
      memo
    end
  end

  def data_as_dicerollers
    person_to_rollers.values.flatten
  end

  def person_to_lucky_percentage
    person_to_rollers.reduce({}) do |memo, pair|
      name = pair[0]
      rollers = pair[1]
      lucky_rolls = rollers.select(&:lucky?).count 
      memo[name] = (lucky_rolls / (Float(common_number_of_trials)) * 100).round
      memo
    end
  end

  def person_to_rollers
    @ptr ||= @csv_data.reduce(Hash.new{ |h,k| h[k] = [] }) do |memo, row|
      roller_name = row[1]
      roll_results = row.last.split(",").map(&:to_i)
      dice = roll_results.map { |i| Die.new_with_value(row[2], i) }
      memo[roller_name] << DiceRoller.new_with_dice(dice)
      memo
    end
  end
end

la = LuckAnalyzer.new('dur.csv')
least_trial_count = la.common_number_of_trials
p least_trial_count
p la.luckiest
p la.lucky_order
