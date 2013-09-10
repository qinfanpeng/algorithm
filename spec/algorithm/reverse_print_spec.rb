
require 'spec_helper'

describe ReversePrinter do
  let(:rp) { ReversePrinter.new }
  context "#reverse_print" do
    it "0 element" do
      rp.reverse_print([]).should == []
    end

    it "1 element" do
      rp.reverse_print([1]).should == [1]
    end
    it "2 element" do
      rp.reverse_print([1, 2]).should == [2, 1]
      rp.reverse_print([2, 2]).should == [2, 2]
    end
    it "3 element" do
      rp.reverse_print([1, 2, 3]).should == [3, 2, 1]
      rp.reverse_print([1, 2, 2]).should == [2, 2, 1]
    end
  end
end
