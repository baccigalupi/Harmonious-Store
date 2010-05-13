require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'AddToCart' do
  before do 
    # build the instance variables needed by the view
    @products = [
      Product.create!(:title => 'expensive cupcake', :price => 3.99),
      Product.create!(:title => 'cheap cake', :price => 0.29)
    ]
    @cart = Cart.create!
    
    # generate html from actual ERB templates!!!
    @html = view_from( '/products/index.html.erb' )
    
    # Create a Harmony page and load it with our files
    js_dir = File.dirname(__FILE__) + '/../../public/javascripts'
    @page = Harmony::Page.new(@html)
    @page.load(
      js_dir + '/class_inheritance.js',
      js_dir + '/jquery-1.4.2.min.js', 
      js_dir + '/addToCart.js'
    )
    
    @request_path = "/carts/#{@cart.id}/items" 
    
    @page.execute_js("
      var events = ''; 
      $.post = function(url, data, success){
          events += 'posting to ' + url + ' with ' + data; 
      }
      var form = new AddToCart($('form.ajax_form').get(0));
    ")     
  end
  
  it 'harmony testing should be setup correctly' do 
    true.should == true
  end
  
  describe 'initialization' do
    it 'should have a single form as the dom' do
      @page.x("form.dom.is('form')").should be_true
      @page.x("form.dom.size()").should == 1
    end
    
    it 'should call listen()' do 
      @page.x("
        AddToCart.prototype.listen = function(){
          events += 'listen() called';
        };
        
        form = new AddToCart($('form.ajax_form').get(0));
        
        events
      ").should include 'listen() called'
    end
  end
  
  describe 'listen()' do 
    it 'should listen for form submit' do
      @page.x("
        AddToCart.prototype.request = function(){
          events += 'request() called'; 
        };
        
        form = new AddToCart($('form.ajax_form').get(0)); 
        form.dom.trigger('submit');
        
        events
      ").should include 'request() called'
    end
  end
  
  describe 'request()' do
    before do
      @page.x("form.request();")
    end
     
    it 'should make a request to the correct url' do
      @page.x("events").should include @request_path
    end
    
    it 'should make a request with the correct data' do
      @page.x("events").should include( "product_id", @products.first.id.to_s )
    end
  end 
  
  describe 'success(response)' do
    before do
      @page.x("
        form.success(\"<span class='new'>New Task</span>\")
      ")
    end
    
    it 'should remove the existing cart dom' do
      @page.x("$('div.cart').size()").should == 0
    end
    
    it 'should insert the response' do
      @page.x("$('span.new').size()").should == 1
    end
  end   
end
    