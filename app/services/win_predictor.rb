class WinPredictor
  DEFEATS_CHARS = ["D", "E", "F", "E", "A", "T", "S"]
  attr_accessor :team_name, :defeats_count
  def initialize(options={})
    @team_name    = options[:team_name]
    @defeats_count = []
  end

  def calculateChange
    self.count # to udpate self.defeats_count
    array_of_integer = self.defeats_count
    array_of_integer = convert_to_digital_array(array_of_integer)
    while array_of_integer.length > 2
      array_of_integer = add_sequential_pair_of_digits(array_of_integer)
      array_of_integer = convert_to_digital_array(array_of_integer)
    end
    return array_of_integer.join('').to_i
  end

  def count
    DEFEATS_CHARS.each do |character|
      count = self.team_name.scan(/#{character}/i).count
      self.defeats_count << count
    end
  end

  def add_sequential_pair_of_digits(array_of_integer)
    new_array = []
    array_of_integer.each_with_index do |integer, index|
      if index + 1 != array_of_integer.length
        new_array << (integer + array_of_integer[index + 1])
      end
    end
    return new_array
  end

  def convert_to_digital_array(array_of_integer)
    new_array = []
    array_of_integer.each_with_index do |integer, index|
      if integer >= 10
        new_array += [1, (integer - 10)]
      else
        new_array << integer
      end
    end
    return new_array
  end

end
