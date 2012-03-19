module Wrapper
  def self.wrap(string, max)
    return string if string.length <= max
    test_string = string[0...max]
    white_space = test_string.rindex /\s/
    limit       = white_space || max
    first       = string[0...limit]
    rest        = string[limit..-1].strip
    (first + "\n" + wrap(rest, max)).strip
  end
end
