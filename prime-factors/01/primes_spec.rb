require 'minitest/autorun'
require './primes'

class PrimeFactorsTests < MiniTest::Unit::TestCase
  def test_correct_factors
    subjects.each do |(number, primes)|
      assert_equal primes, Primes.prime_factorize(number)
    end
  end

  def subjects
    [[1, []],
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
     [16, [2, 2, 2, 2]]]
  end
end

