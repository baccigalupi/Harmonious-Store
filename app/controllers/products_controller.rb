class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all
    @cart =     Cart.last

    respond_to do |format|
      format.html # index.html.erb
      # format.xml  { render :xml => @products }
    end
  end
end
