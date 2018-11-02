#!/usr/bin/env ruby
require 'csv'
NAMES=%w(Pablo Byron Max Demetrius Belinda Arya)

def random_name
  NAMES[rand(NAMES.length)]
end

CSV.open("dur.csv", "wb") do |csv|
  1.upto(100) do |i|
    csv << [i, random_name, 6, "#{rand(6) + 1},#{rand(6) + 1}"]
  end
end

