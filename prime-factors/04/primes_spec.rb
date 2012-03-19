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
     [10, [2, 5]],
     [11, [11]],
     [12, [2, 2, 3]],
     [13, [13]],
     [14, [2, 7]],
     [15, [3, 5]],
     [16, [2, 2, 2, 2]],
     [17, [17]],
     [18, [2, 3, 3]],
     [19, [19]],
     [20, [2, 2, 5]],
     [21, [3, 7]]]
  end

  test_cases.each do |(number, primes)|
    define_method "test_for_#{number}" do
      assert_equal(primes, Prime.factorize(number))
    end
  end
end
