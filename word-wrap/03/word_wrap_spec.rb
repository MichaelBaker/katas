require 'minitest/autorun'
require './word_wrap'

class WrapperTest < MiniTest::Unit::TestCase
  def self.test_cases
    [["empty string",                "",                "",               5],
     ["word longer than max",        "wor\nd",          "word",           3],
     ["space at max",                "word\nword",      "word word",      5],
     ["space before max",            "word\nword",      "word word",      6],
     ["space after max",             "wor\nd\nwor\nd",  "word word",      3],
     ["two words together",          "word word\nword", "word word word", 11],
     ["max longer than string",      "word",            "word",           7],
     ["string with trailing spaces", "word",            "word ",          4]]
  end

  test_cases.each do |(test_name, expected, string, max)|
    define_method "test_#{test_name.gsub(/\s/, "_")}" do
      assert_equal(expected, Wrapper.wrap(string, max))
    end
  end
end
