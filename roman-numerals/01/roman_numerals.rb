module Numerals
  Conversions = [[1000, ["-", "-", "M"]],
                 [100,  ["M", "D", "C"]],
                 [10,   ["C", "L", "X"]],
                 [1,    ["X", "V", "I"]]]

  def self.arabic_to_roman(number)
    return "" if number == 0
    min, symbols = Conversions.find {|min, symbols| number >= min}
    roman_numeral(*symbols, number / min) + arabic_to_roman(number % min)
  end

  def self.roman_to_arabic(number)
    return 0 if number.length == 0
    last_digit, rest = parse_roman_string(number)
    roman_to_arabic(rest) + last_digit
  end

  private

  def self.roman_numeral(high, middle, low, digit)
    if digit == 9
      low + high
    elsif digit >= 5
      middle + roman_numeral(high, middle, low, digit - 5)
    elsif digit == 4
      low + middle
    else
      low * digit
    end
  end

  def self.parse_roman_string(roman)
    Conversions.reverse.each do |base, (high, middle, low)|
      if roman.end_with? low + high
        return [9*base, roman[0...-2]]
      elsif roman.end_with? middle + low + low + low
        return [8 * base, roman[0...-4]]
      elsif roman.end_with? middle + low + low
        return [7 * base, roman[0...-3]]
      elsif roman.end_with? middle + low
        return [6 * base, roman[0...-2]]
      elsif roman.end_with? low + middle
        return [4*base, roman[0...-2]]
      elsif roman.end_with? middle
        return [5*base, roman[0...-1]]
      elsif roman.end_with? low * 3
        return [3 * base, roman[0...-3]]
      elsif roman.end_with? low * 2
        return [2 * base, roman[0...-2]]
      elsif roman.end_with? low
        return [base, roman[0...-1]]
      end
    end
  end
end
