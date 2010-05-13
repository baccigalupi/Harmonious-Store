require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cart do
  before(:each) do
    @valid_attributes = {
      :total => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Cart.create!(@valid_attributes)
  end
end