class CartLineItem < ActiveRecord::Base 
  belongs_to :cart
  belongs_to :product
  
  def total 
    product.price * quantity
  end
end
