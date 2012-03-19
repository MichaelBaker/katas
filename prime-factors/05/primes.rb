module Primes
  def self.factorize(x)
    factors(x, 2)
  end

  private

  def self.factors(x, divisor)
    return [] if x < 2
    if divisor.factor_of?(x)
      [divisor] + factors(x/divisor, divisor)
    else
      factors(x, divisor + 1)
    end
  end
end

class Fixnum
  def factor_of?(x)
    x % self == 0
  end
end
