require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartLineItem do
  it 'should have a total' do
    product = Product.create(:title => 'My Thing', :price => 4.5)  
    item = CartLineItem.new(:product => product, :quantity => 3)
    item.total.to_f.should == 4.5*3
  end
end
