require 'spec_helper'
require 'benchmark'

describe Frog do

  let(:frog) { Frog.new }

  context "function test" do
    it "3 steps" do
      frog.jump(3).should == 3
    end
    it "4 steps" do
      frog.jump(4).should == 5
    end
    it "5 steps" do
      frog.jump(5).should == 8
    end
  end

  context "bounder test" do
    it "0 steps" do
      expect {frog.jump(0)}.to raise_error('the number of steps must be greater than 0')
    end
    it "1 steps" do
      frog.jump(1).should == 1
    end
    it "2 steps" do
      frog.jump(2).should == 2
    end
  end

  context "performance test" do
    it "execute time" do
      Benchmark.measure { frog.jump(5) }
    end
  end

end
