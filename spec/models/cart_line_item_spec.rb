require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartLineItem do
  before(:each) do
    @valid_attributes = {
      :cart_id => 1,
      :product_id => 1,
      :quantity => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CartLineItem.create!(@valid_attributes)
  end
end
