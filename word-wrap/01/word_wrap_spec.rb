require 'minitest/autorun'
require './word_wrap'

class WordWrapTest < MiniTest::Unit::TestCase
  def test_empty_string
    assert_equal("", Wrapper.wrap("", 5))
  end

  def test_a_word_shorter_than_the_max
    assert_equal("word", Wrapper.wrap("word", 5))
  end

  def test_a_single_word_longer_than_the_max
    assert_equal("hello\nthar", Wrapper.wrap("hellothar", 5))
  end

  def test_breaking_on_boundary_between_two_words
    assert_equal("hi\nthar", Wrapper.wrap("hi thar", 4))
  end

  def test_breaking_on_boundary_between_two_words
    assert_equal("hi\nthar\nu", Wrapper.wrap("hi thar u", 5))
  end

  def test_breaking_on_boundary_including_space
    assert_equal("hi thar\nu", Wrapper.wrap("hi thar u", 8))
  end
  
  def test_breaking_a_really_long_word
    assert_equal("aaaaa\nbbbbb\nccccc", Wrapper.wrap("aaaaabbbbbccccc", 5))
  end
end
