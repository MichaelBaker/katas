require 'minitest/autorun'
require './primes'

class PrimesTest < MiniTest::Unit::TestCase
  def self.test_cases
    [[0, []],
     [1, []],
     [2, [2]],
     [3, [3]],
     [4, [2, 2]],
     [5, [5]],
     [6, [2, 3]],
     [7, [7]],
     [8, [2, 2, 2]],
     [9, [3, 3]],
     [10, [2, 5]]]
  end

  test_cases.each do |(number, primes)|
    define_method "test_#{number}" do
      assert_equal(primes, number.prime_factors)
    end
  end
end
