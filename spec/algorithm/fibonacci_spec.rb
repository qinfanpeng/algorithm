
require 'spec_helper'
# 1, 1, 2, 3, 5, 8, 13, 21
describe Fibonacci do
  let(:fb) { Fibonacci.new }
  subject { Fibonacci.new }
  context "#produce" do
    it "0th or 1th fiboncci" do
      fb.produce(0).should == 1
      fb.produce(1).should == 1
    end

    it "2th fibnoacci" do
      fb.produce(2).should == 2
    end
    it "3th fibnoacci" do
      fb.produce(3).should == 3
    end
    it "4th fibnoacci" do
      fb.produce(4).should == 5
    end
    it "5th fibnoacci" do
      fb.produce(5).should == 8
    end

  end
  it { should respond_to :produce }
end
