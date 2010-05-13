class Cart < ActiveRecord::Base
  has_many :line_items, :class_name => 'CartLineItem', :dependent => :destroy
  has_many :products, :through => :line_items
  
  def total
    sum = 0;
    line_items.each{|r| sum += r.total}
    sum
  end  
end
