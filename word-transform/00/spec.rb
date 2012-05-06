require "rspec"
require "./word-morph"

describe "returns a set of steps that morphs the receiver into the argument" do
  specify "a -> I" do
    "a".morph_into("I").should == ["a", "I"]
  end

  specify "ann -> ebb" do
    "ann".morph_into("ebb").should == ["ann", kkkkkk, "ebb"]
  end
end
