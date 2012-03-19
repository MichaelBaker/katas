module Wrapper
  def self.wrap(text, max_column)
    lines = []
    while text.length > max_column
      line        = text[0...max_column]
      white_space = line.rindex /\s/
      limit       = white_space || max_column
      lines << text[0...limit]
      text = text[limit..-1].strip
    end
    lines << text
    lines.join "\n"
  end
end
