module Primes
  def self.factorize(x)
    find_prime_factors(x, 2)
  end

  private

  def self.find_prime_factors(x, divisor)
    return [] if x < 2
    if divisor.factor_of?(x)
      [divisor] + find_prime_factors(x/divisor, divisor)
    else
      find_prime_factors(x, divisor + 1)
    end
  end
end

class Fixnum
  def factor_of?(x)
    x % self == 0
  end
end
