require 'populator'

Product.delete_all
Product.populate 50 do |product|
  product.title = Populator.words(1..2).titleize 
  product.price = "#{rand(99)}.#{rand(99)}"
  product.created_at = 2.years.ago..Time.now
end

Cart.delete_all
Cart.create!

CartLineItem.delete_all 