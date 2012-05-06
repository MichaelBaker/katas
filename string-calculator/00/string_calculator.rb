module StringCalculator
  DEFAULT_SEPARATOR         = /,|\s/
  MULTI_CHARACTER_SEPARATOR = /\[(.*?)\]/
  CUSTOM_SEPARATOR_LINE     = /^\/\/(.*)\n/
  VALID_NUMBERS             = lambda { |number| 0 <= number && number <= 1000 }

  def self.add(string)
    numbers = string_to_list string
    assert_no_negative_numbers numbers
    numbers.select(&VALID_NUMBERS).reduce &:+
  end

  private

  def self.string_to_list(string)
    return [0] if string.empty?
    string, separator = parse_string_with_separator(string) if contains_custom_separator? string
    string.split(separator || DEFAULT_SEPARATOR).map &:to_i
  end

  def self.assert_no_negative_numbers(numbers)
    negative_numbers = numbers.select { |number| number < 0 }
    if negative_numbers.any?
      raise "Negatives not allowed: #{negative_numbers.join(', ')}"
    end
  end

  def self.parse_string_with_separator(string)
    separator = parse_separator string[CUSTOM_SEPARATOR_LINE]
    [string.sub(CUSTOM_SEPARATOR_LINE, ""), separator]
  end

  def self.parse_separator(line)
    if line =~ MULTI_CHARACTER_SEPARATOR
      Regexp.new line.scan(MULTI_CHARACTER_SEPARATOR)
                 .flatten
                 .map {|separator| Regexp.escape separator}
                 .join("|")
    else
      line[2]
    end
  end

  def self.contains_custom_separator?(string)
    string.start_with? "//"
  end
end
