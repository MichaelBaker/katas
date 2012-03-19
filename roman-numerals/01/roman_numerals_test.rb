require 'minitest/autorun'
require './roman_numerals'

class RomanNumeralsTest < MiniTest::Unit::TestCase
  def self.test_cases
    [["M",       1000],
     ["MM",      2000],
     ["CM",      900],
     ["DCCC",    800],
     ["DCC",     700],
     ["DC",      600],
     ["D",       500],
     ["CD",      400],
     ["MC",      1100],
     ["MCD",     1400],
     ["C",       100],
     ["L",       50],
     ["LX",      60],
     ["XC",      90],
     ["LXXX",    80],
     ["XXX",     30],
     ["XL",      40],
     ["CXXX",    130],
     ["V",       5],
     ["IX",      9],
     ["VIII",    8],
     ["IV",      4],
     ["MCMXCIX", 1999]]
  end

  test_cases.each do |roman, arabic|
    define_method "test_#{arabic}_to_#{roman}" do
      assert_equal(roman, Numerals.arabic_to_roman(arabic))
    end

    define_method "test_#{roman}_to_#{arabic}" do
      assert_equal(arabic, Numerals.roman_to_arabic(roman))
    end
  end
end
