class Integer
  def factor_of?(x)
    x % self == 0
  end

  def prime_factors
    factors_for(self, 2)
  end

  private

  def factors_for(x, divisor)
    return [] if x < 2
    if divisor.factor_of? x
      [divisor] + factors_for(x/divisor, divisor)
    else
      factors_for(x, divisor + 1)
    end
  end
end
