
require 'spec_helper'

describe ReversePrinter do
  let(:rp) { ReversePrinter.new }

  shared_examples_for "reverse print" do |reverse|
    it "1 element" do
      rp.send(reverse, [1]).should == [1]
    end
    it "2 element" do
      rp.send(reverse, [1, 2]).should == [2, 1]
      rp.send(reverse, [2, 2]).should == [2, 2]
    end
    it "3 element" do
      rp.send(reverse, [1, 2, 3]).should == [3, 2, 1]
      rp.send(reverse, [1, 2, 2]).should == [2, 2, 1]
    end
    it "and more ..." do
      rp.send(reverse, [1, 2, 3, 4, 5]).should == [5, 4, 3, 2, 1]
    end
  end
  context "#stack_reverse_print" do
    it_behaves_like "reverse print", :stack_reverse_print
  end
  context "#recursion_reverse_print" do
    it_behaves_like "reverse print", :recursion_reverse_print
  end
end
