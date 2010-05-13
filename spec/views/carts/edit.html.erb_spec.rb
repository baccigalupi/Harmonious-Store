require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carts/edit.html.erb" do
  include CartsHelper
  
  before(:each) do
    assigns[:cart] = @cart = stub_model(Cart,
      :new_record? => false,
      :total => 9.99
    )
  end

  it "renders the edit cart form" do
    render
    
    response.should have_tag("form[action=#{cart_path(@cart)}][method=post]") do
      with_tag('input#cart_total[name=?]', "cart[total]")
    end
  end
end


