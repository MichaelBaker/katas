module Numerals
  Table = [[1000, "M"],
           [900,  "CM"],
           [500,  "D"],
           [400,  "CD"],
           [100,  "C"],
           [90,   "XC"],
           [50,   "L"],
           [40,   "XL"],
           [10,   "X"],
           [9,    "IX"],
           [5,    "V"],
           [4,    "IV"],
           [1,    "I"]]

  def self.arabic_to_roman(number)
    return "" if number == 0
    value, token = Table.find {|value, token| number >= value}
    token + arabic_to_roman(number - value)
  end

  def self.roman_to_arabic(roman_number)
    return 0 if roman_number.length == 0
    value, token = Table.find {|value, token| roman_number.start_with? token}
    value + roman_to_arabic(roman_number.sub(token, ""))
  end
end
