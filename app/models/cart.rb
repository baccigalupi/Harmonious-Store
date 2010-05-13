class Cart < ActiveRecord::Base
  has_many :line_items, :class_name => 'CartLineItem'
  has_many :products, :through => :line_items
end
