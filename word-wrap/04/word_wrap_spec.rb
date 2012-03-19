require 'minitest/autorun'
require './word_wrap'

class WrapperTest < MiniTest::Unit::TestCase
  def test_empty_string
    assert_equal("", Wrapper.wrap("", 2))
  end

  def test_max_on_word_boundary
    assert_equal("word\nword", Wrapper.wrap("word word", 5))
  end

  def test_max_less_than_word_length
    assert_equal("wor\nd", Wrapper.wrap("word", 3))
  end

  def test_max_longer_than_two_words
    assert_equal("word word\nword", Wrapper.wrap("word word word", 12))
  end

  def test_really_long_string
    assert_equal((["word"]*10000).join("\n"), Wrapper.wrap((["word"]*10000).join(" "), 5))
  end
end
