require 'minitest/autorun'
require './word_wrap'

class WordWrapTest < MiniTest::Unit::TestCase
  def test_empty_string
    assert_equal("", Wrapper.wrap("", 5))
  end

  def test_word_longer_than_max
    assert_equal("aaa\naaa", Wrapper.wrap("aaaaaa", 3))
  end

  def test_word_much_longer_than_max
    assert_equal("aaa\naaa\naaa\naaa", Wrapper.wrap("aaaaaaaaaaaa", 3))
  end

  def test_space_at_boundary
    assert_equal("word\nword", Wrapper.wrap("word word", 5))
  end

  def test_space_before_max
    assert_equal("word\nword", Wrapper.wrap("word word", 6))
  end

  def test_two_spaces_before_boundary
    assert_equal("word word\nword", Wrapper.wrap("word word word", 11))
  end

  def test_really_short_words
    assert_equal("wo\nrd\nwo\nrd", Wrapper.wrap("word word", 2))
  end

  def test_whitespace_after_max
    assert_equal("wor\nd\nwor\nd", Wrapper.wrap("word word", 3))
  end
end
