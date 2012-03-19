module Primes
  def self.prime_factorize(x)
    find_factors(x, 2)
  end

  private

  def self.find_factors(x, divisor)
    return [] if x < 2
    if divisor.factor_of? x
      [divisor] + find_factors(x/divisor, divisor)
    else
      find_factors(x, divisor.next)
    end
  end
end

class Fixnum
  def factor_of?(x)
    x % self == 0
  end
end
