require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/new.html.erb" do
  include ProductsHelper
  
  before(:each) do
    assigns[:product] = stub_model(Product,
      :new_record? => true,
      :title => "value for title",
      :price => 9.99
    )
  end

  it "renders new product form" do
    render
    
    response.should have_tag("form[action=?][method=post]", products_path) do
      with_tag("input#product_title[name=?]", "product[title]")
      with_tag("input#product_price[name=?]", "product[price]")
    end
  end
end


