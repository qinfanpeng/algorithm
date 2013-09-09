# -*- coding: utf-8 -*-
class Gsub

  # === 字符串替换函数
  # 自己实现一个简单算法把字符串中的空白字符全都替换为‘-+-’
  # ruby 自己带了个gsub方法， 现在自己实现它， 使其时间
  # 复杂度为 O（n）.
  # 1.思路是先统计出所有空格个数， 然后计算替换后的字符串总长度，
  # 2.设置两个游标，其中第一个游标置于字符串移动前的末尾处， 第二个游标置于替换后字符串的末尾处
  # 3.依次向后移动字符串，直到第一个游标遇到空格，
  # 4.进行替换， 然后第一个游标移动一格， 第二个游标移动3格，
  # 5.重复，知道两个游标重复；
  # 图示参考《剑指Offer》46页
  #
  def gsub(s)
    space_count = s.scan(/\s/).size
    s_a = s.split('')
    append_a = Array.new(space_count * 2)
    final_a = s_a + append_a
    p1 = s_a.size - 1
    p2 = final_a.size - 1
    ((final_a.size - 1).downto 0).each do |i|
      break if p1 == p2   # 表示替换完成
      unless s_a[p1] == ' '
        final_a[p2] = s_a[p1]
        p1 -= 1
        p2 -= 1
      else
        p1 -= 1
        final_a[p2] = '-'
        p2 -= 1
        final_a[p2] = '+'
        p2 -= 1
        final_a[p2] = '-'
        p2 -= 1
      end
    end
    final_a.join ''
  end
end
