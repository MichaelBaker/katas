require './string_calculator'

describe StringCalculator do
  describe ".add" do
    context "sums a string of numbers separated by" do
      it "commas" do
        StringCalculator.add("1,2").should == 3
      end

      it "new-lines" do
        StringCalculator.add("1\n2").should == 3
      end
    end

    it "rejects negative numbers with an exception" do
      expect { StringCalculator.add("-1") }.to raise_error /-1/
    end

    context "considers" do
      it "the empty string to be zero" do
        StringCalculator.add("").should == 0
      end

      it "a single number to sum to itself" do
        StringCalculator.add("1").should == 1
        StringCalculator.add("2").should == 2
      end
    end
  end
end
