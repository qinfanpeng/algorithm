require 'spec_helper'
describe Link do
  let(:link) { Link.new }

  describe 'delete a node in O(1)'do
    it 'only 1 node' do
      node = Node.new 1
      link << node
      expect(link.delete_under_O1(node)).to eq []
    end
    it "many nodes" do
      node2 =  Node.new(2)
      link << Node.new(1) << node2 << Node.new(3) << Node.new(4)

      expect(link.delete_under_O1(node2)).to eq [1, 3, 4]
    end
    it "to delete node is last" do
      link << Node.new(1) << Node.new(2) << Node.new(3)
      node = Node.new 4
      link << node
      expect(link.delete_under_O1(node)).to eq [1, 2, 3]
    end
  end
end
