require 'spec_helper'

describe ArrayMerger do
  let(:array_merger) { ArrayMerger.new }
  describe "Merge two sorted array to one sorted array" do
    it "one array is nil" do
      expect(array_merger.merge([1, 2], nil)).to eq [1, 2]
      expect(array_merger.merge(nil, [1])).to eq [1]
    end
    it "two array are nil" do
      expect { array_merger.merge(nil, nil) }
        .to raise_error("There are need two array")
    end
    it "two array are the same size" do
      expect(array_merger.merge([1, 3, 5], [2, 4, 6]))
        .to eq [1, 2, 3, 4, 5, 6]
    end
    it "two array are different size" do
      expect(array_merger.merge([1, 3, 5], [2, 4, 6, 8]))
        .to eq [1, 2, 3, 4, 5, 6, 8]
    end
  end
end
