require './string_calculator'

describe StringCalculator do
  describe "#add sums a stringified list of numbers" do
    describe "accepts lists separated by" do
      it "commas" do
        StringCalculator.new("1,2").add.should    == 3
        StringCalculator.new("1,2,3").add.should  == 6
        StringCalculator.new("1,"*100).add.should == 100
      end

      it "new-lines" do
        StringCalculator.new("1\n2").add.should    == 3
        StringCalculator.new("1\n2\n2").add.should == 5
        StringCalculator.new("1\n"*50).add.should  == 50
      end
    end

    describe "accepts a custom separator on the first line of the string" do
      specify "a single character in the form //<separator>" do
        StringCalculator.new("//;\n1;2").add.should == 3
      end

      specify "multiple characters in the form //[<characters]" do
        StringCalculator.new("//[***]\n1***2").add.should == 3
      end

      specify "multiple separators in the form //[<separator1>][<separator2>]" do
        StringCalculator.new("//[&][%]\n1&2%3").add.should == 6
        StringCalculator.new("//[&!][%]\n1&!2%3").add.should == 6
      end
    end

    it "ignores numbers greater than 1000" do
      StringCalculator.new("1,1001").add.should == 1
    end

    it "raises an error for negative numbers" do
      expect { StringCalculator.new("-1").add }.to raise_error /-1/
    end

    it "considers the empty string to be zero" do
      StringCalculator.new("").add.should == 0
    end

    it "considers a list of one number to sum to itself" do
      StringCalculator.new("1").add.should == 1
    end
  end
end
