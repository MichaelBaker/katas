module Wrapper
  def self.wrap(string, max_column)
    final_string = ""
    return string if string.length <= max_column
    while string
      string         = string.strip
      working_string = string[0...max_column]
      white_space    = working_string.rindex /\s/
      limit          = white_space || max_column
      chunk          = string[0...limit]
      string         = string[limit..-1]
      final_string   = final_string + "\n" + chunk
    end
    final_string.strip
  end
end
