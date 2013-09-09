# -*- coding: utf-8 -*-

class Find
  #
  # 假设一个二维数组中，每一行从左到右都递增，
  # 每一列从上到下也递增。
  # 此方法用于判断一个整数是否存在于这样一个二维数组中之中
  #
  def find_e_from_a_two_dimension_array1(a, n)
    return false if a[0][0] > n

    for i in 0..(a[0].size-1)
      for j in 0..(a.size-1)
        return true if a[j][i] == n
      end
    end

    return false
  end

  def find_e_from_a_two_dimension_array(a, n)
    target_column_end = a[0].size - 1

    for row in 0..(a.size-1)
      (target_column_end.downto(0)).each do |col|
        return true if a[row][col] == n
        if a[row][col] > n
          column_end = col - 1  # 如果当前元素大于待查数， 表明目标区域只可能在其右边
        elsif a[row][col] < n
          break  # 如果当前元素小于待查数， 表明目标区域不可能在当前行了， 故跳出循环
        end
      end
    end

    return false
  end
end
