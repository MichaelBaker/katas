require 'minitest/autorun'
require './primes'

class PrimesTest < MiniTest::Unit::TestCase
  def self.test_cases
    [[1, []],
     [2, [2]],
     [3, [3]],
     [4, [2, 2]],
     [5, [5]],
     [6, [2, 3]],
     [7, [7]],
     [8, [2, 2, 2]],
     [9, [3, 3]],
     [2*3*5*7*11*13, [2, 3, 5, 7, 11, 13]],
     [8191*131071, [8191, 131071]],
     [2**100, (0...100).map{2}],
     [2**19-1, [2**19-1]],
     [2**31-1, [2**31-1]],
     [131071*(2**19-1), [131071, 2**19-1]]]
  end

  test_cases.each do |(number, primes)|
    define_method "test_#{number}" do
      assert_equal(primes, Primes.factors(number))
    end
  end
end
