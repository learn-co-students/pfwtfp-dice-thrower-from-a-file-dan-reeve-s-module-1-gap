require 'csv'

class LuckAnalyzer
  def initialize
    # If this method is given a paramter of file_name, it can be used to define
    # file_path and that path can be used by the CSV library to load the file.
    #
    # Loading files this way looks complicated, but helps make the data file
    # available to the test framework.
    # file_path = File.join(File.dirname(__FILE__), *['..', file_name])
  end
end
