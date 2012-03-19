require 'minitest/autorun'
require './word_wrap'

class WrapperTest < MiniTest::Unit::TestCase
  def test_empty_string
    assert_equal("", Wrapper.wrap("", 2))
  end

  def test_string_shorter_than_max
    assert_equal("word", Wrapper.wrap("word", 5))
  end

  def test_space_on_max
    assert_equal("word\nword", Wrapper.wrap("word word", 5))
  end

  def test_word_longer_than_max
    assert_equal("wo\nrd", Wrapper.wrap("word", 2))
  end

  def test_space_within_line
    assert_equal("word word", Wrapper.wrap("word word", 12))
  end

  def test_space_and_newline_together
    assert_equal("word word\nword", Wrapper.wrap("word word word", 12))
  end
end
