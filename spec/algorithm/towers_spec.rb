
require 'spec_helper'

describe Tower do
  let(:tw) { Tower.new }

  shared_examples_for "move disks:" do |move|
    it "1 tower" do
      tw.send(move, disks: 1).should == ['A --> C']
    end
    it "2 tower" do
      tw.send(move, disks: 2).should == ["A --> B", "A --> C", "B --> C"]
    end
    it "3 tower" do
      tw.send(move, disks: 3).should == [
        "A --> C",
        "A --> B",
        "C --> B",
        "A --> C",
        "B --> A",
        "B --> C",
        "A --> C"]
    end
  end

  context "#recursion_towers" do
    it_behaves_like "move disks:", :recursion_towers
  end

  context "#towers" do
    it_behaves_like "move disks:", :towers
  end
end
