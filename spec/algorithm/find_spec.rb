
require 'spec_helper'

describe Find do

  def assert(a, n , _true)
    find = Find.new
    find.find_e_from_a_two_dimension_array(a, n).should be _true
  end
  context "#find a element in two dimension array" do
    it "2x2 " do
      assert [[1, 2],
              [2, 4]], 0.5, false
      assert [[1, 2],
              [2, 4]], 1, true
    end
    it "3x3 " do
      assert [[1, 2, 8],
              [2, 4, 9],
              [4, 7, 10]], 7, true
      assert [[1, 2, 8],
              [2, 4, 9],
              [4, 7, 10]], 5, false

    end
    it "4x4 " do
      assert [[1, 2, 8, 9],
              [2, 4, 9, 12],
              [4, 7, 10, 13],
              [6, 8, 11, 15]], 10, true
      assert [[1, 2, 8, 9],
              [2, 4, 9, 12],
              [4, 7, 10, 13],
              [6, 8, 11, 15]], 14, false

    end

  end

end
