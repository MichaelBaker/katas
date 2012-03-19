class Integer
  def prime_factors
    x       = self
    divisor = 2
    primes  = []
    while x >= 2
      if x % divisor == 0
        primes << divisor
        x = x / divisor
      else
        divisor = divisor + 1
      end
    end
    primes
  end
end
