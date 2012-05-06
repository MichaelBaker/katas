module StringCalculator
  def self.add(string)
    return 0 if string.empty?
    numbers = string.split(/[^-0-9]/).map(&:to_i)
    negative_numbers = numbers.select {|number| number < 0}
    raise "No negatives #{negative_numbers.join(", ")}" if negative_numbers.any?
    numbers.reduce &:+
  end
end
