
require 'spec_helper'
# 1, 1, 2, 3, 5, 8, 13, 21
describe Fibonacci do
  let(:fb) { Fibonacci.new }
  shared_examples_for "to produce" do |produce|
    it "0th or 1th fiboncci" do
      fb.send(produce, 0).should == 1
      fb.send(produce, 1).should == 1
    end

    it "2th fibnoacci" do
      fb.send(produce, 2).should == 2
    end
    it "3th fibnoacci" do
      fb.send(produce, 3).should == 3
    end
    it "4th fibnoacci" do
      fb.send(produce, 4).should == 5
    end
    it "5th fibnoacci" do
      fb.send(produce, 5).should == 8
    end
  end
  context "#recursion_produce" do
    it_behaves_like "to produce", :recursion_produce
  end

  context "#produce" do
    it_behaves_like "to produce", :produce
  end

  context "#stack_produce" do
    pending
    #it_behaves_like "to produce", :stack_produce
  end

end
