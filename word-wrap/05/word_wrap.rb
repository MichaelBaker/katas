module Wrapper
  def self.wrap(text, max_column)
    lines = []
    while text.length > max_column
      text         = text.strip
      current_line = text[0...max_column]
      whitespace   = current_line.rindex /\s/
      breakpoint   = whitespace || max_column
      lines << text[0...breakpoint]
      text = text[breakpoint..-1].strip
    end
    lines << text.strip
    (lines.join "\n").strip
  end
end
