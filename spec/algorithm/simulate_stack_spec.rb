
require "spec_helper"

describe SimulateStack do
  let(:ss) { SimulateStack.new }
  context "push" do
    it "1 element to it" do
      ss.push(1).should == [1]
      ss.size.should == 1
    end
    it "2 elements to it" do
      ss.push(1)
      ss.push(2).should == [2, 1]
      ss.size.should == 2
    end
    it "2 elements to it with <<" do
      ss << 1
      ss << 2
      ss.<<(3).should == [3, 2, 1]
      ss.size.should == 3
    end
  end

  context "pop" do
    it "from 1 item stack" do
      ss << 1
      ss.pop.should == 1
      ss.size.should == 0
    end
    it "from 2 items stack" do
      ss << 1
      ss << 2

      ss.pop.should == 2
      ss.size.should == 1

      ss.pop.should == 1
      ss.size.should == 0
    end
    it "push after pop, then pop" do
      ss << 1
      ss << 2

      ss.pop.should == 2
      ss.size.should == 1

      ss << 3

      ss.pop.should == 3
      ss.size.should == 1

      ss.pop.should == 1
      ss.size.should == 0

      ss.pop.should == nil
      ss.size.should == 0
    end
  end
end
