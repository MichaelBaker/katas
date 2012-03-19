require 'minitest/autorun'
require './roman_numerals'

class NumeralsTest < MiniTest::Unit::TestCase
  def self.test_cases
    [["I", 1],
     ["II", 2],
     ["III", 3],
     ["X", 10],
     ["XX", 20],
     ["XXX", 30],
     ["V", 5],
     ["VI", 6],
     ["IX", 9],
     ["IV", 4],
     ["C", 100],
     ["M", 1000],
     ["CM", 900],
     ["D", 500],
     ["L", 50],
     ["XL", 40],
     ["XLV", 45],
     ["DCCC", 800],
     ["CD", 400],
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
