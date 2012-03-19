module Primes
  def self.prime_factors(x)
    prime_factorize(x, 2)
  end

  private

  def self.prime_factorize(x, divisor)
    return [] if x < 2
    if divisor.factor_of? x
      [divisor] + prime_factorize(x/divisor, divisor)
    else
      prime_factorize(x, divisor.next)
    end
  end
end

class Fixnum
  def factor_of?(x)
    x % self == 0
  end
end
