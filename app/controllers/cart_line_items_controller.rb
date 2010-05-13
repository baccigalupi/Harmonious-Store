class CartLineItemsController < ApplicationController
  # POST /carts/:id/items
  def create
    @cart = Cart.find(params[:cart_id])
    @line_item = CartLineItem.create(
      :product_id => params[:item][:product_id], 
      :cart_id => @cart.id,
      :quantity => 1
    )
    render :partial => '/carts/show'
  end
end
