
require 'spec_helper'

describe SimulateQueue do
  let(:sq1) do
    sq1 = SimulateQueue.new
    sq1.enq(1)
    sq1
  end
  let(:sq2) do
    sq2 = SimulateQueue.new
    sq2.enq(1)
    sq2.enq(2)
    sq2
  end
  let(:sq3) do
    sq3 = SimulateQueue.new
    sq3.enq(1)
    sq3.enq(2)
    sq3.enq(3)
    sq3
  end

  context "simulate queue with 2 stacks" do
    context "empty queue" do
      context "enq" do
        it "1 element" do
          sq = SimulateQueue.new
          sq.enq(1).should == [1]
          sq.length.should == 1
        end
        it "2 elements" do
          sq = SimulateQueue.new
          sq.enq(1)
          sq.enq(2).should == [1, 2]
          sq.length.should == 2
        end
        it "and more elements" do
          sq = SimulateQueue.new
          sq.enq(1)
          sq.enq(2)
          sq.enq(3).should == [1, 2, 3]
          sq.length.should == 3
        end
      end

      context "deq" do
        it "1 element" do
          sq1.deq.should == 1
          sq1.length.should == 0
        end
        it "2 elements" do
          sq2.deq.should == 1
          sq2.length.should == 1

          sq2.deq.should == 2
          sq2.length.should == 0
        end
        it "and more elements" do
          sq3.deq.should == 1
          sq3.length.should == 2

          sq3.deq.should == 2
          sq3.length.should == 1

          sq3.deq.should == 3
          sq3.length.should == 0

          sq3.deq.should == nil
          sq3.length.should == 0
        end
      end
    end

    context "not empty queue" do
      context "enq" do
        it "already 1 element" do
          sq1.enq(2).should == [1, 2]
          sq1.length.should == 2
        end
        it "already 2 elements" do
          sq2.enq(3).should == [1, 2, 3]
          sq2.length.should == 3
        end
      end

      context "deq" do
        it "enq after deq" do
          sq3.deq.should == 1
          sq3.length.should == 2

          sq3.enq(4).should == [2, 3, 4]
          sq3.length.should == 3

          sq3.deq.should == 2
          sq3.length.should == 2

          sq3.enq(5).should == [3, 4, 5]
          sq3.length.should == 3
        end
      end
    end
  end
end
