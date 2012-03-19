module Primes
  def self.factors(x)
    primes  = []
    divisor = 2
    limit   = Math.sqrt x
    while x >= 2
      if x % divisor == 0
        primes << divisor
        x = x / divisor
      elsif divisor > limit
        divisor = x
      else
        divisor = divisor + 1
      end
    end
    primes
  end
end
