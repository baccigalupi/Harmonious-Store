require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cart_line_items/edit.html.erb" do
  include CartLineItemsHelper
  
  before(:each) do
    assigns[:cart_line_item] = @cart_line_item = stub_model(CartLineItem,
      :new_record? => false,
      :cart_id => 1,
      :product_id => 1,
      :quantity => 1
    )
  end

  it "renders the edit cart_line_item form" do
    render
    
    response.should have_tag("form[action=#{cart_line_item_path(@cart_line_item)}][method=post]") do
      with_tag('input#cart_line_item_cart_id[name=?]', "cart_line_item[cart_id]")
      with_tag('input#cart_line_item_product_id[name=?]', "cart_line_item[product_id]")
      with_tag('input#cart_line_item_quantity[name=?]', "cart_line_item[quantity]")
    end
  end
end


