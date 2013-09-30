# -*- coding: utf-8 -*-
class Integer
  # === 获取一个整数二进制表示中 1 的个数
  # - 1.统计整数二进制表示的长度设为length，设有一个标志数flag=1
  # - 2.然后n与flag的二进制 进行与(&)运算，如果为 1 则 统计个数加1，
  # - 3.然后将flag向左位移一位
  # - 执行2，3步骤length次
  def number_of_1_in_binary
    count, flag = 0, 1
    length = self.to_s(2).size
    length.times do
      count += 1 if (self & flag) != 0
      flag = flag << 1
    end
    count
  end
end
