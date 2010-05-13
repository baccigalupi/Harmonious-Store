require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "carts", :action => "index").should == "/carts"
    end
  
    it "maps #new" do
      route_for(:controller => "carts", :action => "new").should == "/carts/new"
    end
  
    it "maps #show" do
      route_for(:controller => "carts", :action => "show", :id => "1").should == "/carts/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "carts", :action => "edit", :id => "1").should == "/carts/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "carts", :action => "create").should == {:path => "/carts", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "carts", :action => "update", :id => "1").should == {:path =>"/carts/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "carts", :action => "destroy", :id => "1").should == {:path =>"/carts/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/carts").should == {:controller => "carts", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/carts/new").should == {:controller => "carts", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/carts").should == {:controller => "carts", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/carts/1").should == {:controller => "carts", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/carts/1/edit").should == {:controller => "carts", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/carts/1").should == {:controller => "carts", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/carts/1").should == {:controller => "carts", :action => "destroy", :id => "1"}
    end
  end
end
