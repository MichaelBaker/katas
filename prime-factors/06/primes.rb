module Primes
  def self.factorize(x)
    prime_factors(x, 2)
  end

  private

  def self.prime_factors(number, divisor)
    return [] if number < 2
    if divisor.factor_of? number
      [divisor] + prime_factors(number/divisor, divisor)
    else
      prime_factors(number, divisor + 1)
    end
  end
end

class Fixnum
  def factor_of?(x)
    x % self == 0
  end
end
