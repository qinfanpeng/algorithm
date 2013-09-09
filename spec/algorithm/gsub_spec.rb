# -*- coding: utf-8 -*-
require 'spec_helper'

describe Gsub do
  let(:g) { Gsub.new }
  context "#gsub" do
    it "0 space" do
      g.gsub('hello').should == 'hello'
    end

    it "1 space" do
      g.gsub(' hello').should == '-+-hello'
      g.gsub(' hello ').should == '-+-hello-+-'
      g.gsub('hello world').should == 'hello-+-world'
    end
    it "2 space" do
      g.gsub('  hello').should == '-+--+-hello'
      g.gsub('hello  ').should == 'hello-+--+-'
      g.gsub(' hello ').should == '-+-hello-+-'
      g.gsub('hello  world').should == 'hello-+--+-world'
    end
    it "any number space" do
      s1 = ' Hello world? How do you do ? '
      g.gsub(s1).should == s1.gsub(/\s/, '-+-')

      s2 = '我是中 国人， 我爱我的 祖国 ！ '
      g.gsub(s2).should == s2.gsub(/\s/, '-+-')

    end
  end
end
