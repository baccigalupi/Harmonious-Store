require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cart do
  
  it 'should have a summed total' do
    products = [
      Product.create(:title => '1', :price => 30.99),
      Product.create(:title => '2', :price => 19.99)
    ]
    cart = Cart.create!
    cart.line_items.create!(:product => products.first, :quantity => 1)
    cart.line_items.create!(:product => products.last, :quantity => 2)
    cart.total.should == 30.99 + 19.99*2
  end
end
