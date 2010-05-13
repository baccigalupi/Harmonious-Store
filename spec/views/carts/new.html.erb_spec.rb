require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/carts/new.html.erb" do
  include CartsHelper
  
  before(:each) do
    assigns[:cart] = stub_model(Cart,
      :new_record? => true,
      :total => 9.99
    )
  end

  it "renders new cart form" do
    render
    
    response.should have_tag("form[action=?][method=post]", carts_path) do
      with_tag("input#cart_total[name=?]", "cart[total]")
    end
  end
end


