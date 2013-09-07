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


  it "# select sort" do
    assert_equal :select_sort, @to_sort_n, sorted_n
    assert_equal :select_sort, @to_sort_c, sorted_c
  end

  it "# bubble sort" do
    assert_equal :bubble_sort, @to_sort_n, sorted_n
    assert_equal :bubble_sort, @to_sort_c, sorted_c
  end

  context "#quick sort" do
    it "1 element" do
      assert_equal :quick_sort, [1], [1]
      assert_equal :quick_sort, ['a'], ['a']
    end
    it "2 element" do
      assert_equal :quick_sort, [2, 1], [1, 2]
      assert_equal :quick_sort, ['b', 'a'], ['a', 'b']
      assert_equal :quick_sort, [2, 2], [2, 2]
    end
    it "3 element" do
      assert_equal :quick_sort, [2, 3, 1], [1, 2, 3]
      assert_equal :quick_sort, ['b', 'c', 'a'], ['a', 'b', 'c']
      assert_equal :quick_sort, [2, 1, 2], [1, 2, 2]
    end
    it "4 element" do
      assert_equal :quick_sort, [4, 2, 3, 1], [1, 2, 3, 4]
      assert_equal :quick_sort, ['d', 'b', 'c', 'a'], ['a', 'b', 'c', 'd']
      assert_equal :quick_sort, [3, 2, 1, 2], [1, 2, 2, 3]
      assert_equal :quick_sort, [2, 2, 1, 2], [1, 2, 2, 2]
    end
    it ">4 element" do
      assert_equal :quick_sort, [4, 2, 5, 3, 1], [1, 2, 3, 4, 5]
      assert_equal :quick_sort, ['e', 'd', 'b', 'c', 'a'], ['a', 'b', 'c', 'd', 'e']
      assert_equal :quick_sort, [3, 2, 4, 1, 2], [1, 2, 2, 3, 4]
      assert_equal :quick_sort, [2, 2, 1, 3, 2], [1, 2, 2, 2, 3]
      assert_equal :quick_sort, [4, 2, 5, 3, 6, 1], [1, 2, 3, 4, 5, 6]
    end

  end


end
