require 'spec_helper'

describe Integer do
  describe 'the number of 1 in binary' do
    it '1.number_of_1_in_binary.should == 1'do
      1.number_of_1_in_binary.should == 1
    end
    it '2.number_of_1_in_binary.should == 1'do
      2.number_of_1_in_binary.should == 1
    end
    it '3.number_of_1_in_binary.should == 2'do
      3.number_of_1_in_binary.should == 2
    end
    it '4.number_of_1_in_binary.should == 1'do
      4.number_of_1_in_binary.should == 1
    end
    it '5.number_of_1_in_binary.should == 2'do
      5.number_of_1_in_binary.should == 2
    end
    it '6.number_of_1_in_binary.should == 2'do
      6.number_of_1_in_binary.should == 2
    end
    it '7.number_of_1_in_binary.should == 3'do
      7.number_of_1_in_binary.should == 3
    end
  end

end
