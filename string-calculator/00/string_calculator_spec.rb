require './string_calculator'

describe StringCalculator do
  describe ".add" do
    it "sums a list of numbers separated by commas or newlines" do
      StringCalculator.add("1,2").should     == 3
      StringCalculator.add("1,2,3").should   == 6
      StringCalculator.add("1,1,1,1").should == 4
      StringCalculator.add("1,"*100).should  == 100
      StringCalculator.add("1\n2").should    == 3
      StringCalculator.add("1\n2\n2").should == 5
      StringCalculator.add("1,2\n5").should  == 8
    end

    context "accepts user defined delimiters on the first line of the string" do
      it "of a single character in the form //<delimiter>" do
        StringCalculator.add("//;\n1;2").should == 3
      end

      it "of multiple characters in the form //[<characters>]" do
        StringCalculator.add("//[***]\n1***2").should == 3
      end

      it "multiple delimiters in the form //[<delimeter1>][<delimeter2>]" do
        StringCalculator.add("//[*][%]\n1*2%3").should       == 6
        StringCalculator.add("//[**][%]\n1**2%3").should     == 6
        StringCalculator.add("//[!!!][&*]\n1&*2!!!3").should == 6
      end
    end

    it "rejects negative numbers with an exception that includes the offending numbers" do
      expect { StringCalculator.add("-1").should }.to raise_error /-1/
    end

    it "ignores numbers greater than 1000" do
      StringCalculator.add("2,1001").should == 2
    end

    it "considers the empty string to sum to zero" do
      StringCalculator.add("").should == 0
    end

    it "considers a list of one element to sum to itself" do
      StringCalculator.add("1").should == 1
    end
  end
end
