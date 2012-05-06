class StringCalculator
  def initialize(string)
    self.original_string = string
    self.string = string.dup
    extract_separator
    extract_numbers
    assert_no_negatives
    filter_out_large_numbers
  end

  def add
    return 0 if string.empty?
    numbers.reduce &:+
  end

  private

  attr_accessor :string, :separator, :numbers, :original_string

  def extract_separator
    self.separator = /,|\n/
    extract_custom_separator if custom_separator?
  end

  def extract_custom_separator
    if string.start_with? "//["
      self.separator = Regexp.new string.scan(/\[(.+?)\]/)
         .flatten
         .map { |separator| Regexp.escape separator }
         .join("|")
    else
      self.separator = string[2]
    end
    string.sub!(/\/\/.*\n/, "")
  end

  def custom_separator?
    string.start_with? "//"
  end

  def extract_numbers
    self.numbers = string.split(separator).map &:to_i
  end

  def assert_no_negatives
    raise "No negatives #{negative_numbers.join ', '}" if negative_numbers.any?
  end

  def filter_out_large_numbers
    numbers.select! { |number| 0 <= number && number <= 1000 }
  end

  def negative_numbers
    numbers.select { |number| number < 0 }
  end
end
