require 'minitest/autorun'
require './word_wrap'

class WrapperTest < MiniTest::Unit::TestCase
  def test_empty_string
    assert_equal("", Wrapper.wrap("", 2))
  end

  def test_string_shorter_than_max
    assert_equal("word", Wrapper.wrap("word", 10))
  end

  def test_string_longer_than_max
    assert_equal("wo\nrd", Wrapper.wrap("word", 2))
  end

  def test_string_with_space_jusr_after_max
    assert_equal("word\nword", Wrapper.wrap("word word", 4))
  end

  def test_string_with_space_before_max
    assert_equal("word\nword", Wrapper.wrap("word word", 7))
  end

  def test_string_with_a_space_on_a_line
    assert_equal("word word\nword", Wrapper.wrap("word word word", 12))
  end

  def test_string_same_line_as_max
    assert_equal("word", Wrapper.wrap("word", 4))
  end
end
