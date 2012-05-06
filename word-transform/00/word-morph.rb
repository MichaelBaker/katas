RubyVM::InstructionSequence.compile_option = {
  :tailcall_optimization => true,
  :trace_instruction => false
}

require "set"

$dict = Set.new

File.open "word-list.txt" do |file|
  file.each_line do |line|
    $dict << line.chomp unless line.chomp =~ /\W/
  end
end

def tries(word)
  set = []
  word.each_char.with_index do |char, index|
    ("a".."z").each do |sub|
      next if sub == char
      new_word = word.dup
      new_word[index] = sub
      set << new_word if $dict.include?(new_word)
    end
  end
  set
end

def successful_match?(attempt, target)
  attempt.last == target
end

def next_set(attempts, this_attempt)
  tries(this_attempt.last).reject do |word|
    this_attempt.include? word
  end.each do |next_try|
    attempts << (this_attempt.clone << next_try)
  end
  attempts
end

def morph(attempts, target)
  this_attempt = attempts.shift
  return this_attempt if successful_match?(this_attempt, target)
  morph(next_set(attempts, this_attempt), target)
end

p morph([["ruby"]], "code")
