require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/edit.html.erb" do
  include ProductsHelper
  
  before(:each) do
    assigns[:product] = @product = stub_model(Product,
      :new_record? => false,
      :title => "value for title",
      :price => 9.99
    )
  end

  it "renders the edit product form" do
    render
    
    response.should have_tag("form[action=#{product_path(@product)}][method=post]") do
      with_tag('input#product_title[name=?]', "product[title]")
      with_tag('input#product_price[name=?]', "product[price]")
    end
  end
end


