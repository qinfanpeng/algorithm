# -*- coding: utf-8 -*-
class Link
  def initialize
    @link = []
  end

  def << (node)
    @link.last.next = node if @link.last
    @link << node
    return self
  end
end
