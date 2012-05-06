require 'watchr'

watch ".*" do |filename|
  system "clear"
  system "ruby word_wrap_spec.rb"
end
