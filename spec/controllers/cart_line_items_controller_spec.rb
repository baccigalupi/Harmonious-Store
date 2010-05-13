require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartLineItemsController do

  def mock_cart_line_item(stubs={})
    @mock_cart_line_item ||= mock_model(CartLineItem, stubs)
  end
  
  describe "GET index" do

    it "exposes all cart_line_items as @cart_line_items" do
      CartLineItem.should_receive(:find).with(:all).and_return([mock_cart_line_item])
      get :index
      assigns[:cart_line_items].should == [mock_cart_line_item]
    end

    describe "with mime type of xml" do
  
      it "renders all cart_line_items as xml" do
        CartLineItem.should_receive(:find).with(:all).and_return(cart_line_items = mock("Array of CartLineItems"))
        cart_line_items.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested cart_line_item as @cart_line_item" do
      CartLineItem.should_receive(:find).with("37").and_return(mock_cart_line_item)
      get :show, :id => "37"
      assigns[:cart_line_item].should equal(mock_cart_line_item)
    end
    
    describe "with mime type of xml" do

      it "renders the requested cart_line_item as xml" do
        CartLineItem.should_receive(:find).with("37").and_return(mock_cart_line_item)
        mock_cart_line_item.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new cart_line_item as @cart_line_item" do
      CartLineItem.should_receive(:new).and_return(mock_cart_line_item)
      get :new
      assigns[:cart_line_item].should equal(mock_cart_line_item)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested cart_line_item as @cart_line_item" do
      CartLineItem.should_receive(:find).with("37").and_return(mock_cart_line_item)
      get :edit, :id => "37"
      assigns[:cart_line_item].should equal(mock_cart_line_item)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created cart_line_item as @cart_line_item" do
        CartLineItem.should_receive(:new).with({'these' => 'params'}).and_return(mock_cart_line_item(:save => true))
        post :create, :cart_line_item => {:these => 'params'}
        assigns(:cart_line_item).should equal(mock_cart_line_item)
      end

      it "redirects to the created cart_line_item" do
        CartLineItem.stub!(:new).and_return(mock_cart_line_item(:save => true))
        post :create, :cart_line_item => {}
        response.should redirect_to(cart_line_item_url(mock_cart_line_item))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved cart_line_item as @cart_line_item" do
        CartLineItem.stub!(:new).with({'these' => 'params'}).and_return(mock_cart_line_item(:save => false))
        post :create, :cart_line_item => {:these => 'params'}
        assigns(:cart_line_item).should equal(mock_cart_line_item)
      end

      it "re-renders the 'new' template" do
        CartLineItem.stub!(:new).and_return(mock_cart_line_item(:save => false))
        post :create, :cart_line_item => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested cart_line_item" do
        CartLineItem.should_receive(:find).with("37").and_return(mock_cart_line_item)
        mock_cart_line_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cart_line_item => {:these => 'params'}
      end

      it "exposes the requested cart_line_item as @cart_line_item" do
        CartLineItem.stub!(:find).and_return(mock_cart_line_item(:update_attributes => true))
        put :update, :id => "1"
        assigns(:cart_line_item).should equal(mock_cart_line_item)
      end

      it "redirects to the cart_line_item" do
        CartLineItem.stub!(:find).and_return(mock_cart_line_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cart_line_item_url(mock_cart_line_item))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested cart_line_item" do
        CartLineItem.should_receive(:find).with("37").and_return(mock_cart_line_item)
        mock_cart_line_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cart_line_item => {:these => 'params'}
      end

      it "exposes the cart_line_item as @cart_line_item" do
        CartLineItem.stub!(:find).and_return(mock_cart_line_item(:update_attributes => false))
        put :update, :id => "1"
        assigns(:cart_line_item).should equal(mock_cart_line_item)
      end

      it "re-renders the 'edit' template" do
        CartLineItem.stub!(:find).and_return(mock_cart_line_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested cart_line_item" do
      CartLineItem.should_receive(:find).with("37").and_return(mock_cart_line_item)
      mock_cart_line_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the cart_line_items list" do
      CartLineItem.stub!(:find).and_return(mock_cart_line_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cart_line_items_url)
    end

  end

end
