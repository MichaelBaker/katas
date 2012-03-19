module Wrapper
  def self.wrap(string, max)
    return string if string.length <= max
    white_space_breakpoint = string[0...max].rindex(/\s/)
    limit = white_space_breakpoint || max
    string[0...limit].strip + "\n" + wrap(string[limit..-1].strip, max)
  end
end
