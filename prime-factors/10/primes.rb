class Integer
  def prime_factors
    return @prime_factors if @prime_factors
    x              = self
    divisor        = 2
    @prime_factors = []
    limit          = Math.sqrt x
    while x >= 2
      if divisor.factor_of? x
        @prime_factors << divisor
        x = x / divisor
      elsif divisor > limit
        divisor = x
      else
        divisor = divisor + 1
      end
    end
    @prime_factors
  end

  def factor_of?(x)
    x % self == 0
  end
end
