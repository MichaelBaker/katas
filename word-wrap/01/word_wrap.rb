module Wrapper
  def self.wrap(string, max_length)
    string = string.strip
    return string if string.length < max_length
    working_string = string[0..max_length]
    white_space    = working_string.rindex(/\s/)
    if string[0...max_length] =~ /\s/
      [string[0...white_space], wrap(string[white_space..-1], max_length)]
    else
      [string[0...max_length], wrap(string[max_length..-1], max_length)]
    end.flatten.join("\n").strip
  end
end
