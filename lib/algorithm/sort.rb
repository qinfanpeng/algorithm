# -*- coding: utf-8 -*-
require 'pry'
class Sort
  # === 选择排序
  # 每次从未排序部分的列表中<b>选择</b>最小的，将其放到未排序部分列表的最前面。
  def select_sort(a)
    for i in 0..(a.size-2)
      mini_pos = i
      for j in (i+1)..(a.size-1)
        mini_pos = j if a[mini_pos] > a[j]
      end
      temp = a[i]
      a[i] = a[mini_pos]
      a[mini_pos] = temp
    end
    return a
  end

  # === 冒泡排序
  # 它重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。
  # 走访数列的工作是重复地进行直到没有再需要交换，
  # 名字由来:: 越小的元素会经由交换慢慢"浮"到数列的顶端，像<b>冒泡</b>样。

  def bubble_sort(a)
    for i in 0..(a.size-2)
      for j in (i+1)..(a.size-1)
        if a[i] > a[j]
          temp = a[i]
          a[i] = a[j]
          a[j] = temp
        end
      end
    end
    return a
  end

  # === 快速排序
  # 1.从列表中任意选择一个数
  # 2.让列表中剩下的元素与第1步选择的数字作比较，
  # 小于它的放在一边令其为a1， 大于它的放在另外一边令其为a2
  # 3.分别在a1和a2中重复执行第1和第2步，直到只剩一个元素
  # 4.把上面所得连接起来
  def quick_sort(a)
    return a if a.size <= 1  # 当a为空数组或是一个元素时直接返回
    middle_pos = (a.size)/2
    a1, a2 = [], []
    for i in 0..(a.size-1)
      # 把小于等于选取元素的元素， 但是排除选取的元素，追加到 a1中
      if a[i] < a[middle_pos] || (i != middle_pos && a[i] == a[middle_pos])
        a1 << a[i]
      elsif a[i] > a[middle_pos]
        a2 << a[i]
      end
    end
    quick_sort(a1) + [a[middle_pos]] + quick_sort(a2)  # 递归调用
  end

end
