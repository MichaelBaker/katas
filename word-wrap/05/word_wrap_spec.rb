require 'minitest/autorun'
require './word_wrap'

class WrapperTest < MiniTest::Unit::TestCase
  def test_empty_string
    assert_equal("", Wrapper.wrap("", 3))
  end

  def test_word_longer_than_max
    assert_equal("wo\nrd", Wrapper.wrap("word", 2))
  end

  def test_space_on_max
    assert_equal("word\nword", Wrapper.wrap("word word", 5))
  end

  def test_space_after_max
    assert_equal("wor\nd\nwor\nd", Wrapper.wrap("word word", 3))
  end

  def test_space_before_max
    assert_equal("word\nword", Wrapper.wrap("word word", 6))
  end

  def test_large_string
    assert_equal(("word\n"*10000).chomp, Wrapper.wrap(("word "*10000).chomp, 5))
  end
end
