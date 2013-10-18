require 'spec_helper'

describe Link do
  let(:link) { Link.new }

  describe "Return kth node in link form end " do
    it 'link with 0 node' do
      expect(link.kth_node_from_end(1)).to be_nil
    end
    it 'k = 0 ' do
      link << Node.new(1)
      expect(link.kth_node_from_end(0)).to be_nil
    end
    it "k > link's length " do
      link << Node.new(1)
      expect(link.kth_node_from_end(2)).to be_nil
    end
    it "normal link and appropriate k " do
      link << Node.new(1)
      link << Node.new(2)
      link << Node.new(3)
      expect(link.kth_node_from_end(2).data).to eq 2
    end
  end
end
