require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CartsController do

  def mock_cart(stubs={})
    @mock_cart ||= mock_model(Cart, stubs)
  end
  
  describe "GET index" do

    it "exposes all carts as @carts" do
      Cart.should_receive(:find).with(:all).and_return([mock_cart])
      get :index
      assigns[:carts].should == [mock_cart]
    end

    describe "with mime type of xml" do
  
      it "renders all carts as xml" do
        Cart.should_receive(:find).with(:all).and_return(carts = mock("Array of Carts"))
        carts.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested cart as @cart" do
      Cart.should_receive(:find).with("37").and_return(mock_cart)
      get :show, :id => "37"
      assigns[:cart].should equal(mock_cart)
    end
    
    describe "with mime type of xml" do

      it "renders the requested cart as xml" do
        Cart.should_receive(:find).with("37").and_return(mock_cart)
        mock_cart.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new cart as @cart" do
      Cart.should_receive(:new).and_return(mock_cart)
      get :new
      assigns[:cart].should equal(mock_cart)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested cart as @cart" do
      Cart.should_receive(:find).with("37").and_return(mock_cart)
      get :edit, :id => "37"
      assigns[:cart].should equal(mock_cart)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created cart as @cart" do
        Cart.should_receive(:new).with({'these' => 'params'}).and_return(mock_cart(:save => true))
        post :create, :cart => {:these => 'params'}
        assigns(:cart).should equal(mock_cart)
      end

      it "redirects to the created cart" do
        Cart.stub!(:new).and_return(mock_cart(:save => true))
        post :create, :cart => {}
        response.should redirect_to(cart_url(mock_cart))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved cart as @cart" do
        Cart.stub!(:new).with({'these' => 'params'}).and_return(mock_cart(:save => false))
        post :create, :cart => {:these => 'params'}
        assigns(:cart).should equal(mock_cart)
      end

      it "re-renders the 'new' template" do
        Cart.stub!(:new).and_return(mock_cart(:save => false))
        post :create, :cart => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested cart" do
        Cart.should_receive(:find).with("37").and_return(mock_cart)
        mock_cart.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cart => {:these => 'params'}
      end

      it "exposes the requested cart as @cart" do
        Cart.stub!(:find).and_return(mock_cart(:update_attributes => true))
        put :update, :id => "1"
        assigns(:cart).should equal(mock_cart)
      end

      it "redirects to the cart" do
        Cart.stub!(:find).and_return(mock_cart(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cart_url(mock_cart))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested cart" do
        Cart.should_receive(:find).with("37").and_return(mock_cart)
        mock_cart.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cart => {:these => 'params'}
      end

      it "exposes the cart as @cart" do
        Cart.stub!(:find).and_return(mock_cart(:update_attributes => false))
        put :update, :id => "1"
        assigns(:cart).should equal(mock_cart)
      end

      it "re-renders the 'edit' template" do
        Cart.stub!(:find).and_return(mock_cart(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested cart" do
      Cart.should_receive(:find).with("37").and_return(mock_cart)
      mock_cart.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the carts list" do
      Cart.stub!(:find).and_return(mock_cart(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(carts_url)
    end

  end

end
