require 'spec_helper'

describe Sort do

  let(:sorted_n) { [0, 1, 2, 3, 4, 5] }
  let(:sorted_c) { ['a', 'b', 'c', 'd'] }

  before do
    @to_sort_n = [3, 0, 5, 2, 1, 4]
    @to_sort_c = ['c', 'b', 'a', 'd']
  end

  def assert_equal(sort, to_sort, sorted)
    Sort.new.send(sort, to_sort).should == sorted
  end

  shared_examples_for "sort for:" do |sort|
    it "1 element" do
      assert_equal sort, [1], [1]
      assert_equal sort, ['a'], ['a']
    end
    it "2 element" do
      assert_equal sort, [2, 1], [1, 2]
      assert_equal sort, ['b', 'a'], ['a', 'b']
      assert_equal sort, [2, 2], [2, 2]
    end
    it "3 element" do
      assert_equal sort, [2, 3, 1], [1, 2, 3]
      assert_equal sort, ['b', 'c', 'a'], ['a', 'b', 'c']
      assert_equal sort, [2, 1, 2], [1, 2, 2]
    end
    it "4 element" do
      assert_equal sort, [4, 2, 3, 1], [1, 2, 3, 4]
      assert_equal sort, ['d', 'b', 'c', 'a'], ['a', 'b', 'c', 'd']
      assert_equal sort, [3, 2, 1, 2], [1, 2, 2, 3]
      assert_equal sort, [2, 2, 1, 2], [1, 2, 2, 2]
    end
    it ">4 element" do
      assert_equal sort, [4, 2, 5, 3, 1], [1, 2, 3, 4, 5]
      assert_equal sort, ['e', 'd', 'b', 'c', 'a'], ['a', 'b', 'c', 'd', 'e']
      assert_equal sort, [3, 2, 4, 1, 2], [1, 2, 2, 3, 4]
      assert_equal sort, [2, 2, 1, 3, 2], [1, 2, 2, 2, 3]
      assert_equal sort, [4, 2, 5, 3, 6, 1], [1, 2, 3, 4, 5, 6]
    end
  end

  context "#select sort" do
    it_behaves_like 'sort for:', :select_sort
  end

  context "#bubble sort" do
    it_behaves_like 'sort for:', :bubble_sort
  end

  context "#quick sort" do
    it_behaves_like 'sort for:', :quick_sort
  end


end
