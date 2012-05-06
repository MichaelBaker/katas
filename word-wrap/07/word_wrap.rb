module Wrapper
  def self.wrap(text, max)
    return text if text.length <= max
    current_line = text[0...max]
    whitespace   = current_line.rindex /\s/
    breakpoint   = whitespace || max
    text[0...breakpoint] + "\n" + wrap(text[breakpoint..-1].strip, breakpoint)
  end
end
